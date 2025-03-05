#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/wifi-module.h"
#include "ns3/internet-module.h"
#include "ns3/propagation-module.h"
#include "mavlink-handler.h"

using namespace ns3;

class MAVProxyNetworkSim {
private:
    NodeContainer nodes;
    NetDeviceContainer devices;
    
    // Propagation loss model
    Ptr<PropagationLossModel> propagationModel;

    MavlinkHandler mavlinkHandler;

public:
    MAVProxyNetworkSim(uint32_t nodeCount) : mavlinkHandler("127.0.0.1", 14550) {
        // Create nodes
        nodes.Create(nodeCount);

        // Setup propagation loss model
        propagationModel = CreateObject<LogDistancePropagationLossModel>();
        propagationModel->SetAttribute("Exponent", DoubleValue(3.5));
    }

    void SetupWirelessNetwork() {
        // WiFi setup
        WifiHelper wifi;
        wifi.SetStandard(WIFI_STANDARD_80211ac);

        // Channel with propagation loss
        YansWifiChannelHelper channelHelper;
        channelHelper.AddPropagationLoss("ns3::LogDistancePropagationLossModel", "Exponent", DoubleValue(3.5));
        channelHelper.SetPropagationDelay("ns3::ConstantSpeedPropagationDelayModel");

        YansWifiPhyHelper phyHelper;
        phyHelper.SetChannel(channelHelper.Create());

        WifiMacHelper macHelper;
        macHelper.SetType("ns3::AdhocWifiMac");

        // Install devices
        devices = wifi.Install(phyHelper, macHelper, nodes);
    }

    void ConfigureNetworking() {
        // Install internet stack
        InternetStackHelper internet;
        internet.Install(nodes);

        // Assign IP addresses
        Ipv4AddressHelper ipv4;
        ipv4.SetBase("10.1.0.0", "255.255.0.0");
        ipv4.Assign(devices);
    }

    void RunSimulation(double duration = 100.0) {
        Simulator::Schedule(Seconds(1.0), &MAVProxyNetworkSim::ReceiveMavlinkMessages, this);
        Simulator::Stop(Seconds(duration));
        Simulator::Run();
        Simulator::Destroy();
    }

    void ReceiveMavlinkMessages() {
        mavlinkHandler.ReceiveMessages();
        Simulator::Schedule(Seconds(1.0), &MAVProxyNetworkSim::ReceiveMavlinkMessages, this);
    }

    // Method to update node positions (to be called from MAVProxy)
    void UpdateNodePositions(uint32_t nodeIndex, double x, double y, double z) {
        Ptr<Node> node = nodes.Get(nodeIndex);
        Ptr<MobilityModel> mobility = node->GetObject<MobilityModel>();
        if (mobility) {
            mobility->SetPosition(Vector(x, y, z));
        }
    }

    // Method to send MAVLink messages to ArduPilot
    void SendMavlinkMessage(const mavlink_message_t& msg) {
        mavlinkHandler.SendMessage(msg);
    }
};

int main() {
    // Disable verbose logging
    LogComponentDisableAll(LOG_PREFIX_ALL);

    // Create network simulation with 5 nodes (can be drones, ground stations, etc.)
    MAVProxyNetworkSim networkSim(5);
    
    // Setup network
    networkSim.SetupWirelessNetwork();
    networkSim.ConfigureNetworking();

    // Run simulation
    networkSim.RunSimulation();

    return 0;
}