#include "simulation.h"
#include "ns3/core-module.h"
#include "ns3/internet-module.h"
#include "ns3/network-module.h"
#include "ns3/propagation-module.h"
#include "ns3/wifi-module.h"
#include "ns3/mobility-module.h"
#include "ns3/tap-bridge-module.h"

#include <string>
#include <thread>
#include <chrono>
#include <optional>
using namespace ns3;

int main()
{
    const char* ns3_ip = std::getenv("NS3_IP");
    const char* ns3_port = std::getenv("NS3_PORT");
    const char* mavlink_ip = std::getenv("SITL_IP");
    const char* mavlink_port = std::getenv("SITL_PORT");

    // Enable logging for WiFi and UDP socket
    LogComponentEnable("WifiPhy", LOG_LEVEL_INFO);
    LogComponentEnable("UdpSocket", LOG_LEVEL_INFO);

    // Disable verbose logging
    LogComponentDisableAll(LOG_PREFIX_ALL);

    // Create network simulation instance with TAP network address
    MAVProxyNetworkSim networkSim = MAVProxyNetworkSim(ns3_ip, std::stoi(ns3_port));
    MavlinkHandler* mavlinkHandler = networkSim.GetMavlinkHandler();

    while (networkSim.FetchNodeCount() == 0) {
        mavlinkHandler->ReceiveMessages();
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
    std::cout << "Received Node Count as : " << networkSim.FetchNodeCount() << std::endl;   
    // Run simulation
    std::cout << "Starting MAVProxy network simulation..." << std::endl;
    std::cout << "MAVProxy Connection - " 
              << "Address: " << inet_ntoa(mavlinkHandler->GetMavProxyAddress().sin_addr)
              << " Port: " << ntohs(mavlinkHandler->GetMavProxyAddress().sin_port) << std::endl;
    networkSim.UpdateNodeCount(networkSim.FetchNodeCount());
    networkSim.RunSimulation();

    return 0;
}