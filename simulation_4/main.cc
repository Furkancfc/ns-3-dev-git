#include "ns3/applications-module.h"
#include "ns3/core-module.h"
#include "ns3/internet-module.h"
#include "ns3/mobility-module.h"
#include "ns3/network-module.h"
#include "ns3/point-to-point-module.h"
#include "ns3/trace-helper.h"
#include "ns3/udp-socket.h"

#include <ctime>
#include <fcntl.h> // For open()
#include <fstream>
#include <iomanip>
#include <mutex>
#include <sys/stat.h> // For file size
#include <unistd.h>   // For read() and close()
#include <vector>
using namespace ns3;

NS_LOG_COMPONENT_DEFINE("VideoStreamSimulation");

// Global variables
std::mutex bitrateMutex;
uint32_t targetBitrate = 5000000; // Default bitrate: 5 Mbps
Ipv4InterfaceContainer interfaces;
Ptr<OutputStreamWrapper> logStream;
uint32_t totalFramesSent = 0;
const uint32_t MAX_FRAMES = 300; // 10 seconds at 30 fps
NodeContainer nodes;

// Function to get timestamp for logging
std::string
GetTimestamp()
{
    std::time_t now = std::time(nullptr);
    char timestamp[100];
    std::strftime(timestamp, sizeof(timestamp), "%Y-%m-%d %H:%M:%S", std::localtime(&now));

    // Add ns-3 simulation time with nanosecond precision
    double simTime = Simulator::Now().GetNanoSeconds() / 1e9;
    std::ostringstream oss;
    oss << timestamp << " (sim_time=" << std::fixed << std::setprecision(9) << simTime << "s)";
    return oss.str();
}

// Custom logging function
void
LogToFile(const std::string& message)
{
    if (logStream)
    {
        *logStream->GetStream() << GetTimestamp() << " - " << message << std::endl;
    }
}

// Function to calculate path loss between nodes
double
CalculatePathLoss(uint32_t senderNodeId, uint32_t receiverNodeId)
{
    LogToFile("Calculating path loss between nodes");

    Ptr<Node> senderNode = nodes.Get(senderNodeId);
    Ptr<Node> receiverNode = nodes.Get(receiverNodeId);
    Ptr<MobilityModel> senderMobility = senderNode->GetObject<MobilityModel>();
    Ptr<MobilityModel> receiverMobility = receiverNode->GetObject<MobilityModel>();

    double distance = senderMobility->GetDistanceFrom(receiverMobility);
    if (distance < 1.0)
    {
        distance = 1.0;
    }

    double pathLoss = 20 * log10(distance) + 20 * log10(4 * M_PI / 3e8);

    std::ostringstream oss;
    oss << "Distance: " << distance << "m, Path loss: " << pathLoss << " dB";
    LogToFile(oss.str());

    return pathLoss;
}

// Function to adjust bitrate based on path loss
void
AdjustBitrate(uint32_t senderNodeId, uint32_t receiverNodeId)
{
    LogToFile("Adjusting bitrate");

    Ptr<Node> senderNode = NodeList::GetNode(senderNodeId);
    Ptr<Node> receiverNode = NodeList::GetNode(receiverNodeId);

    double pathLoss = CalculatePathLoss(senderNodeId, receiverNodeId);

    std::lock_guard<std::mutex> lock(bitrateMutex);
    if (pathLoss > 50.0)
    {
        targetBitrate =
            std::max(targetBitrate / 2, static_cast<uint32_t>(1000000)); // Minimum 1 Mbps
        LogToFile("High path loss (" + std::to_string(pathLoss) + " dB), reducing bitrate to " +
                  std::to_string(targetBitrate / 1e6) + " Mbps");
    }
    else
    {
        targetBitrate =
            std::min(targetBitrate * 2, static_cast<uint32_t>(50000000)); // Maximum 50 Mbps
        LogToFile("Low path loss (" + std::to_string(pathLoss) + " dB), increasing bitrate to " +
                  std::to_string(targetBitrate / 1e6) + " Mbps");
    }

    if (totalFramesSent < MAX_FRAMES)
    {
        Simulator::ScheduleWithContext(senderNodeId,
                                       Seconds(1.0),
                                       &AdjustBitrate,
                                       senderNodeId,
                                       receiverNodeId);
    }
}

// Function to handle received packets
void
RecvPacket(Ptr<Socket> socket, Address from)
{
    Ptr<Packet> packet;
    while ((packet = socket->RecvFrom(from)))
    {
        auto addr = InetSocketAddress::ConvertFrom(from);
        LogToFile("Received packet: size=" + std::to_string(packet->GetSize()) + " bytes, from=" +
                  std::to_string(addr.GetIpv4().Get()) + ":" + std::to_string(addr.GetPort()));
    }
}

// Function to send the next frame
void
SndPacket(std::vector<uint8_t>& frameBuffer,
          Ptr<Socket> senderSocket,
          InetSocketAddress remoteAddress)
{
    std::lock_guard<std::mutex> lock(bitrateMutex);
    Ptr<Packet> packet = Create<Packet>(frameBuffer.data(), frameBuffer.size());
	Address remote = remoteAddress.GetIpv4();
    int bytes =
        senderSocket->SendTo(packet, 0, remote);

    if (bytes > 0)
    {
        totalFramesSent++;
        LogToFile("Sent frame " + std::to_string(totalFramesSent) + "/" +
                  std::to_string(MAX_FRAMES) + " (size: " + std::to_string(bytes) + " bytes)");
    }
    else
    {
        LogToFile("Failed to send frame");
    }
}

// Function to stream video
void
VideoStream(int videoFd, Ptr<Socket> senderSocket, InetSocketAddress remoteAddress)
{
    try
    {
        LogToFile("Starting video stream");
        if (videoFd == -1)
        {
            LogToFile("ERROR: Cannot open file");
            perror("Open error");
            return;
        }
        uint32_t frameWidth = 640, frameHeight = 480;
        double targetFrameRate = 30.0;
        uint32_t frameSize = frameWidth * frameHeight * 3 / 2;
        std::vector<uint8_t> frameBuffer(frameSize);
        ssize_t bytesRead = read(videoFd, frameBuffer.data(), frameBuffer.size());

        if (bytesRead == -1)
        {
            LogToFile("ERROR: Failed to read video file.");
            perror("Read error");
            close(videoFd);
            Simulator::Destroy();
            return;
        }
        else if (bytesRead == 0)
        {
            LogToFile("End of video file reached.");
            close(videoFd);
            return;
        }
        LogToFile("Read " + std::to_string(bytesRead) + " bytes from video file.");

        // Create and configure receiver socket
        LogToFile("Socket configuration completed");
        // Schedule subsequent frames
        for (uint32_t i = 1; i < MAX_FRAMES; i++)
        {
            Simulator::Schedule(Seconds(i * (1.0 / targetFrameRate)),
                                &SndPacket,
                                frameBuffer,
                                senderSocket,
                                remoteAddress
							);
        }
    }
    catch (const std::exception& e)
    {
        std::cerr << e.what() << '\n';
        Simulator::Destroy();
    }
}

int
main(int argc, char* argv[])
{
    // Initialize logging
    AsciiTraceHelper ascii;
    logStream = ascii.CreateFileStream("simulation.log");
    LogToFile("Simulation started");

    Time::SetResolution(Time::NS);
    std::string videoFilePath = "video.copy.yuv";

    PointToPointHelper pointToPoint;
    pointToPoint.SetDeviceAttribute("DataRate", StringValue("5Mbps"));
    pointToPoint.SetChannelAttribute("Delay", StringValue("1000ms"));
    LogToFile("Network configuration completed");

    nodes.Create(2);
    NetDeviceContainer devices = pointToPoint.Install(nodes);

    InternetStackHelper internet;
    internet.Install(nodes);

    Ipv4AddressHelper ipv4;
    ipv4.SetBase("10.0.0.0", "255.255.255.0");
    interfaces = ipv4.Assign(devices);


    MobilityHelper mobility;
    mobility.SetMobilityModel("ns3::ConstantPositionMobilityModel");
    mobility.Install(nodes);
    LogToFile("Mobility model installed");

    int videoFd = open(videoFilePath.c_str(), O_RDONLY);
    if (videoFd == -1)
    {
        LogToFile("ERROR: Cannot open video file");
        perror("Open error");
        return 1;
    }
    Ptr<Node> senderNode = nodes.Get(0);
    Ptr<Node> receiverNode = nodes.Get(1);
    Ptr<Socket> ssocket =
        Socket::CreateSocket(senderNode, TypeId::LookupByName("ns3::UdpSocketFactory"));
    Ptr<Socket> rsocket =
        Socket::CreateSocket(receiverNode, TypeId::LookupByName("ns3::UdpSocketFactory"));
    InetSocketAddress localAddress = InetSocketAddress(interfaces.GetAddress(senderNode->GetId()),8080);
    InetSocketAddress remoteAddress =  InetSocketAddress(interfaces.GetAddress(receiverNode->GetId()), 8080);
	std::ostringstream oss;
    oss << "Node IPs configured - Node 0: " << localAddress.GetIpv4() << ":" << localAddress.GetPort()
        << ", Node 1: " << remoteAddress.GetIpv4()<< ":" << remoteAddress.GetPort();
    LogToFile(oss.str());

    if (rsocket->Bind(localAddress) != 0)
    {
        LogToFile("Failed to bind receiver socket");
        return -1;
    }

    // Create and configure sender socket
    if (ssocket->Connect(remoteAddress) != 0)
    {
        LogToFile("Failed to connect sender socket");
        return -1;
    }
    Simulator::ScheduleWithContext(receiverNode->GetId(),
                                   Seconds(0.0),
                                   &RecvPacket,
                                   rsocket,
                                   localAddress);
    Simulator::ScheduleWithContext(senderNode->GetId(),
                                   Seconds(1.0),
                                   &AdjustBitrate,
                                   senderNode->GetId(),
                                   receiverNode->GetId());
    Simulator::ScheduleWithContext(
        senderNode->GetId(),
        Seconds(1.0),
        &VideoStream,
        videoFd,
		ssocket,
        InetSocketAddress(interfaces.GetAddress(receiverNode->GetId()), 8080));
    Simulator::Run();
    Simulator::Destroy();
    LogToFile("Simulation completed");

    close(videoFd);
    return 0;
}