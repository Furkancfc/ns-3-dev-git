#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/mobility-module.h"
#include "ns3/wifi-module.h"
#include "ns3/internet-module.h"
#include "ns3/applications-module.h"
#include "ns3/flow-monitor-module.h"
#include "pathlossmodels.cc"
using namespace ns3;

NS_LOG_COMPONENT_DEFINE("DroneGroundNetwork");

int main(int argc, char *argv[]) {
    CommandLine cmd;
    cmd.Parse(argc, argv);

    NodeContainer uavs, groundNodes;
    uavs.Create(1);          // 3 UAV nodes
    groundNodes.Create(1);   // 5 Ground nodes

    // Mobility Model for UAVs
    MobilityHelper uavMobility;
    uavMobility.SetMobilityModel("ns3::RandomWaypointMobilityModel",
                                 "Speed", StringValue("ns3::ConstantRandomVariable[Constant=10]"),
                                 "Pause", StringValue("ns3::ConstantRandomVariable[Constant=0]"),
                                 "PositionAllocator", StringValue("ns3::RandomRectanglePositionAllocator"));
    uavMobility.Install(uavs);

    // Mobility Model for Ground Nodes (Static)
    MobilityHelper groundMobility;
    groundMobility.SetMobilityModel("ns3::ConstantPositionMobilityModel");
    groundMobility.Install(groundNodes);

    // WiFi Setup
    WifiHelper wifi;
    wifi.SetStandard(WIFI_STANDARD_80211ac);

    YansWifiPhyHelper phy;
    YansWifiChannelHelper channel = YansWifiChannelHelper::Default();
    phy.SetChannel(channel.Create());

    WifiMacHelper mac;
    Ssid ssid = Ssid("drone-network");
    mac.SetType("ns3::AdhocWifiMac", "Ssid", SsidValue(ssid));

    NetDeviceContainer uavDevices = wifi.Install(phy, mac, uavs);
    NetDeviceContainer groundDevices = wifi.Install(phy, mac, groundNodes);

    // Internet Stack
    InternetStackHelper stack;
    stack.Install(uavs);
    stack.Install(groundNodes);

    // Assign IP Addresses
    Ipv4AddressHelper address;
    address.SetBase("192.168.1.0", "255.255.255.0");
    Ipv4InterfaceContainer uavInterfaces = address.Assign(uavDevices);
    Ipv4InterfaceContainer groundInterfaces = address.Assign(groundDevices);

    // UDP Server on Ground Node 0
    UdpEchoServerHelper echoServer(9);
    ApplicationContainer serverApp = echoServer.Install(groundNodes.Get(0));
    serverApp.Start(Seconds(1.0));

    // UDP Client on UAV Node 0
    UdpEchoClientHelper echoClient(groundInterfaces.GetAddress(0), 9);
    echoClient.SetAttribute("MaxPackets", UintegerValue(5));
    echoClient.SetAttribute("Interval", TimeValue(Seconds(1.0)));
    echoClient.SetAttribute("PacketSize", UintegerValue(1024));

    ApplicationContainer clientApp = echoClient.Install(uavs.Get(0));
    clientApp.Start(Seconds(2.0));

    // Enable Flow Monitor
    FlowMonitorHelper flowmon;
    Ptr<FlowMonitor> monitor = flowmon.InstallAll();

    NS_LOG_INFO("Starting simulation...");
    Simulator::Stop(Seconds(100.0));
    Simulator::Run();
    monitor->SerializeToXmlFile("flowmon-results.xml", true, true);
    Simulator::Destroy();
    
    return 0;
}
