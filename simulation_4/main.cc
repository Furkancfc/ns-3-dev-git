#include "ns3/applications-module.h"
#include "ns3/core-module.h"
#include "ns3/internet-module.h"
#include "ns3/mobility-module.h"
#include "ns3/network-module.h"
#include "ns3/point-to-point-module.h"
#include "ns3/tcp-socket-factory.h"
#include "ns3/trace-helper.h"

#include <ctime>
#include <fcntl.h>
#include <fstream>
#include <iomanip>
#include <mutex>
#include <sys/stat.h>
#include <unistd.h>
#include <vector>

using namespace ns3;

NS_LOG_COMPONENT_DEFINE("VideoStreamSimulation");

// Global variables
std::mutex bitrateMutex;
uint32_t targetBitrate = 5000000; // 5 Mbps
Ipv4InterfaceContainer interfaces;
Ptr<OutputStreamWrapper> logStream;
uint32_t totalFramesSent = 0;
const uint32_t MAX_FRAMES = 300;
NodeContainer nodes;

// Prototypes
std::string GetTimestamp();
void LogToFile(const std::string& message);
double CalculatePathLoss(uint32_t senderNodeId, uint32_t receiverNodeId);
void AdjustBitrate(uint32_t senderNodeId, uint32_t receiverNodeId);
void RecvPacket(Ptr<Socket> socket);
void SndPacket(std::vector<uint8_t>& frameBuffer, Ptr<Socket> senderSocket);
void ScheduleNextFrame(std::vector<uint8_t>& frameBuffer, Ptr<Socket> senderSocket, uint32_t frameIndex);
void VideoStream(int videoFd, Ptr<Socket> senderSocket);
void HandleConnection(Ptr<Socket> socket, const Address& from);
void HandleConnectionSuccess(Ptr<Socket> socket);
void HandleConnectionError(Ptr<Socket> socket);

// Implementation
std::string GetTimestamp()
{
    std::time_t now = std::time(nullptr);
    char timestamp[100];
    std::strftime(timestamp, sizeof(timestamp), "%Y-%m-%d %H:%M:%S", std::localtime(&now));
    double simTime = Simulator::Now().GetSeconds();
    std::ostringstream oss;
    oss << timestamp << " (sim_time=" << std::fixed << std::setprecision(9) << simTime << "s)";
    return oss.str();
}

void LogToFile(const std::string& message)
{
    if (logStream)
    {
        *logStream->GetStream() << GetTimestamp() << " - " << message << std::endl;
    }
}

double CalculatePathLoss(uint32_t senderNodeId, uint32_t receiverNodeId)
{
    Ptr<Node> senderNode = nodes.Get(senderNodeId);
    Ptr<Node> receiverNode = nodes.Get(receiverNodeId);
    Ptr<MobilityModel> senderMobility = senderNode->GetObject<MobilityModel>();
    Ptr<MobilityModel> receiverMobility = receiverNode->GetObject<MobilityModel>();

    double distance = senderMobility->GetDistanceFrom(receiverMobility);
    distance = std::max(distance, 1.0);
    return 20 * log10(distance) + 20 * log10(4 * M_PI / 3e8);
}

void AdjustBitrate(uint32_t senderNodeId, uint32_t receiverNodeId)
{
    double pathLoss = CalculatePathLoss(senderNodeId, receiverNodeId);
    
    std::lock_guard<std::mutex> lock(bitrateMutex);
    if (pathLoss > 50.0)
    {
        targetBitrate = std::max(targetBitrate / 2, 1000000U);
        LogToFile("High path loss - New bitrate: " + std::to_string(targetBitrate/1e6) + " Mbps");
    }
    else
    {
        targetBitrate = std::min(targetBitrate * 2, 50000000U);
        LogToFile("Low path loss - New bitrate: " + std::to_string(targetBitrate/1e6) + " Mbps");
    }

    if (totalFramesSent < MAX_FRAMES)
    {
        Simulator::Schedule(Seconds(1.0), &AdjustBitrate, senderNodeId, receiverNodeId);
    }
}

void RecvPacket(Ptr<Socket> socket)
{
    Ptr<Packet> packet;
    while ((packet = socket->Recv()))
    {
        LogToFile("Received packet: " + std::to_string(packet->GetSize()) + " bytes");
    }
}

void SndPacket(std::vector<uint8_t>& frameBuffer, Ptr<Socket> senderSocket)
{
    std::lock_guard<std::mutex> lock(bitrateMutex);
    Ptr<Packet> packet = Create<Packet>(frameBuffer.data(), frameBuffer.size());
    
    if (senderSocket->Send(packet) > 0)
    {
        totalFramesSent++;
        LogToFile("Sent frame " + std::to_string(totalFramesSent) + "/" + std::to_string(MAX_FRAMES));
    }
}

void ScheduleNextFrame(std::vector<uint8_t>& frameBuffer, Ptr<Socket> senderSocket, uint32_t frameIndex)
{
    if (frameIndex >= MAX_FRAMES) return;

    Simulator::Schedule(Seconds(1.0/30.0), &SndPacket, frameBuffer, senderSocket);
    Simulator::Schedule(Seconds(1.0/30.0), &ScheduleNextFrame, frameBuffer, senderSocket, frameIndex + 1);
}

void VideoStream(int videoFd, Ptr<Socket> senderSocket)
{
    const uint32_t frameSize = 640 * 480 * 3 / 2;
    std::vector<uint8_t> frameBuffer(frameSize);

    ssize_t bytesRead = read(videoFd, frameBuffer.data(), frameSize);
    if (bytesRead > 0)
    {
        ScheduleNextFrame(frameBuffer, senderSocket, 0);
    }
}

void HandleConnection(Ptr<Socket> socket, const Address& from)
{
    std::ostringstream oss;
    oss << "Connection established with " << InetSocketAddress::ConvertFrom(from).GetIpv4();
    LogToFile(oss.str());
    oss.str("");
    socket->SetRecvCallback(MakeCallback(&RecvPacket));
}

void HandleConnectionSuccess(Ptr<Socket> socket)
{
    LogToFile("Connection successfully established");
}

void HandleConnectionError(Ptr<Socket> socket)
{
    LogToFile("Connection error: " + std::to_string(socket->GetErrno()));
}

int main(int argc, char* argv[])
{
    // Enable logging
    LogComponentEnable("VideoStreamSimulation", LOG_LEVEL_ALL);
    LogComponentEnable("TcpSocket", LOG_LEVEL_DEBUG);
    
    AsciiTraceHelper ascii;
    logStream = ascii.CreateFileStream("simulation.log");

    // Network setup
    nodes.Create(2);
    
    PointToPointHelper pointToPoint;
    pointToPoint.SetDeviceAttribute("DataRate", StringValue("5Mbps"));
    pointToPoint.SetChannelAttribute("Delay", StringValue("1000ms"));
    
    NetDeviceContainer devices = pointToPoint.Install(nodes);
    
    InternetStackHelper internet;
    internet.Install(nodes);
    
    Ipv4AddressHelper ipv4;
    ipv4.SetBase("10.0.0.0", "255.255.255.0");
    interfaces = ipv4.Assign(devices);

    // Mobility
    MobilityHelper mobility;
    mobility.SetMobilityModel("ns3::ConstantPositionMobilityModel");
    mobility.Install(nodes);
    nodes.Get(0)->GetObject<MobilityModel>()->SetPosition(Vector(0, 0, 0));
    nodes.Get(1)->GetObject<MobilityModel>()->SetPosition(Vector(100, 0, 0));

    // Sockets
    Ptr<Socket> senderSocket = Socket::CreateSocket(nodes.Get(0), TcpSocketFactory::GetTypeId());
    Ptr<Socket> receiverSocket = Socket::CreateSocket(nodes.Get(1), TcpSocketFactory::GetTypeId());

    // Receiver setup
    InetSocketAddress receiverLocalAddress(interfaces.GetAddress(1), 8080);
    receiverSocket->Bind(receiverLocalAddress);
    receiverSocket->Listen();
    receiverSocket->SetAcceptCallback(MakeNullCallback<bool, Ptr<Socket>, const Address&>(),
                                     MakeCallback(&HandleConnection));

    // Sender setup
    senderSocket->SetConnectCallback(
        MakeCallback(&HandleConnectionSuccess),
        MakeCallback(&HandleConnectionError)
    );
    InetSocketAddress remoteAddress(interfaces.GetAddress(1), 8080);
    
    // Schedule connection attempt
    Simulator::Schedule(Seconds(1.0), &Socket::Connect, senderSocket, remoteAddress);

    // Video file
    int videoFd = open("video.copy.yuv", O_RDONLY);
    if (videoFd == -1)
    {
        LogToFile("Error opening video file");
        return 1;
    }

    // Schedule video streaming
    Simulator::Schedule(Seconds(1.5), &VideoStream, videoFd, senderSocket);

    // Bitrate adjustment
    Simulator::Schedule(Seconds(2.0), &AdjustBitrate, 0, 1);

    // Run simulation
    Simulator::Stop(Seconds(20.0));
    Simulator::Run();
    Simulator::Destroy();

    // Cleanup
    close(videoFd);
    LogToFile("Simulation completed");
    return 0;
}