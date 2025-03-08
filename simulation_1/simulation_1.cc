#include "mavlink-handler.h"
#include "ns3/core-module.h"
#include "ns3/internet-module.h"
#include "ns3/network-module.h"
#include "ns3/propagation-module.h"
#include "ns3/wifi-module.h"
#include "ns3/mobility-module.h"
#include "ns3/tap-bridge-module.h"  // Add this include

#include <string>
using namespace ns3;

class MAVProxyNetworkSim
{
  private:
    NodeContainer nodes;
    NetDeviceContainer devices;

    // Propagation loss model
    Ptr<PropagationLossModel> propagationModel;

    MavlinkHandler mavlinkHandler;
    bool networkConfigured;

    void SetupMobilityModel() {
        MobilityHelper mobility;
        mobility.SetMobilityModel("ns3::ConstantPositionMobilityModel");
        mobility.Install(nodes);

        // Set initial positions
        for (uint32_t i = 0; i < nodes.GetN(); ++i) {
            Ptr<MobilityModel> model = nodes.Get(i)->GetObject<MobilityModel>();
            Vector pos(i * 10.0, i * 10.0, 0.0); // Space nodes 10m apart
            model->SetPosition(pos);
        }
    }

  public:
    uint32_t GetNodeCount()
    {
        return nodes.GetN();
    }

    MavlinkHandler* GetMavlinkHandler()
    {
        return &mavlinkHandler;
    }

    MAVProxyNetworkSim()
        : mavlinkHandler("127.0.0.1", 14550), // Use standard MAVLink port
          networkConfigured(false)
    {
        // Setup callback for node count updates
        mavlinkHandler.SetNodeCountCallback(
            std::bind(&MAVProxyNetworkSim::UpdateNodeCount, this, std::placeholders::_1));

        // Setup propagation loss model
        propagationModel = CreateObject<LogDistancePropagationLossModel>();
        propagationModel->SetAttribute("Exponent", DoubleValue(3.5));
    }

    void UpdateNodeCount(uint32_t newCount)
    {
        std::cout << "Updating simulation with " << newCount << " nodes" << std::endl;

        // Clear existing nodes if any
        nodes = NodeContainer();
        devices = NetDeviceContainer();

        // Create new nodes
        nodes.Create(newCount);

        // Reconfigure network if it was configured before
        if (networkConfigured)
        {
            SetupWirelessNetwork();/*  */
            ConfigureNetworking();
        }
    }

    void SetupWirelessNetwork()
    {
        // WiFi setup
        WifiHelper wifi;
        wifi.SetStandard(WIFI_STANDARD_80211ac);

        // Enable PCAP tracing
        YansWifiPhyHelper phyHelper;
        phyHelper.SetPcapDataLinkType(YansWifiPhyHelper::DLT_IEEE802_11_RADIO);

        // Channel with propagation loss
        YansWifiChannelHelper channelHelper;
        channelHelper.AddPropagationLoss("ns3::LogDistancePropagationLossModel",
                                         "Exponent",
                                         DoubleValue(3.5));
        channelHelper.SetPropagationDelay("ns3::ConstantSpeedPropagationDelayModel");

        phyHelper.SetChannel(channelHelper.Create());

        WifiMacHelper macHelper;
        macHelper.SetType("ns3::AdhocWifiMac");

        // Install devices
        devices = wifi.Install(phyHelper, macHelper, nodes);

        // Setup mobility after devices
        SetupMobilityModel();

        // Enable PCAP tracing for all nodes
        phyHelper.EnablePcap("mavlink-sim", devices);
    }

    void ConfigureNetworking()
    {
        // Install internet stack
        InternetStackHelper internet;
        internet.Install(nodes);

        // Use TAP network addressing
        Ipv4AddressHelper ipv4;
        ipv4.SetBase("10.0.0.0", "255.255.255.0");
        Ipv4InterfaceContainer interfaces = ipv4.Assign(devices);

        // Configure tap bridge for node 0
        TapBridgeHelper tapBridge;
        tapBridge.SetAttribute("Mode", StringValue("UseBridge"));
        tapBridge.SetAttribute("DeviceName", StringValue("tap0"));

        // Connect first node to TAP
        tapBridge.Install(nodes.Get(0), devices.Get(0));

        // Enable IP forwarding
        networkConfigured = true;
    }

    void RunSimulation(double duration = 100.0)
    {
        std::cout << "Starting simulation with duration: " << duration << " seconds" << std::endl;
        Simulator::Schedule(Seconds(1.0), &MAVProxyNetworkSim::ReceiveMavlinkMessages, this);
        Simulator::Stop(Seconds(duration));
        Simulator::Run();
        Simulator::Destroy();
    }

    void ReceiveMavlinkMessages()
    {
        mavlinkHandler.ReceiveMessages();
        Simulator::Schedule(Seconds(1.0), &MAVProxyNetworkSim::ReceiveMavlinkMessages, this);
    }

    // Method to update node positions (to be called from MAVProxy)
    void UpdateNodePositions(uint32_t nodeIndex, double x, double y, double z)
    {
        Ptr<Node> node = nodes.Get(nodeIndex);
        Ptr<MobilityModel> mobility = node->GetObject<MobilityModel>();
        if (mobility)
        {
            mobility->SetPosition(Vector(x, y, z));
        }
    }

    // Method to send MAVLink messages to ArduPilot
    void SendMavlinkMessage(const mavlink_message_t& msg)
    {
        mavlinkHandler.SendMessage(msg);
    }
};

int main()
{
    // Enable logging for WiFi
    LogComponentEnable("WifiPhy", LOG_LEVEL_INFO);
    LogComponentEnable("UdpSocket", LOG_LEVEL_INFO);

    // Disable verbose logging
    LogComponentDisableAll(LOG_PREFIX_ALL);

    // Create network simulation instance with TAP network address
    MAVProxyNetworkSim networkSim;
    networkSim.UpdateNodeCount(3);
    MavlinkHandler* mavlinkHandler = networkSim.GetMavlinkHandler();

    // Wait for node count from MAVProxy
    std::cout << "Waiting for node count from MAVProxy..." << std::endl;
    std::cout << "Received Node Count as : " << networkSim.GetNodeCount() << std::endl;

    // Setup network configuration
    networkSim.SetupWirelessNetwork();
    networkSim.ConfigureNetworking();

    // Run simulation
    std::cout << "Starting MAVProxy network simulation..." << std::endl;
    std::cout << "MAVProxy Connection - "
              << "Address: " << inet_ntoa(mavlinkHandler->GetMavProxyAddress().sin_addr)
              << " Port: " << ntohs(mavlinkHandler->GetMavProxyAddress().sin_port) << std::endl;
    networkSim.RunSimulation();

    return 0;
}
