#ifndef MAVLINK_HANDLER_H
#define MAVLINK_HANDLER_H

#include <mavlink/v2.0/common/mavlink.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <unistd.h>
#include <iostream>
#include <functional>
#include <cstring>

class MavlinkHandler {
private:
    int sockfd;
    struct sockaddr_in mavproxyAddr;
    std::function<void(uint32_t)> nodeCountCallback;
    uint8_t system_id;
    uint8_t component_id;

    bool setupSocket() {
        int reuseAddr = 1;
        setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &reuseAddr, sizeof(reuseAddr));
        
        // Bind to TAP interface
        struct sockaddr_in addr;
        memset(&addr, 0, sizeof(addr));
        addr.sin_family = AF_INET;
        addr.sin_addr.s_addr = inet_addr("10.0.0.1");  // NS3_IP
        addr.sin_port = htons(14552);  // NS3_PORT
        
        if (bind(sockfd, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
            std::cerr << "Bind failed: " << strerror(errno) << std::endl;
            return false;
        }
        return true;
    }

public:
    MavlinkHandler(const std::string& ip, uint16_t port, uint8_t sysid = 1, uint8_t compid = MAV_COMP_ID_UDP_BRIDGE) 
        : system_id(sysid), component_id(compid) {
        sockfd = socket(AF_INET, SOCK_DGRAM, 0);
        if (sockfd < 0) {
            std::cerr << "Failed to create socket: " << strerror(errno) << std::endl;
            exit(EXIT_FAILURE);
        }

        mavproxyAddr.sin_family = AF_INET;
        mavproxyAddr.sin_port = htons(port);
        inet_pton(AF_INET, ip.c_str(), &mavproxyAddr.sin_addr);

        if (!setupSocket()) {
            close(sockfd);
            exit(EXIT_FAILURE);
        }
        
        std::cout << "MavlinkHandler initialized on port 14552" << std::endl;
    }

    ~MavlinkHandler() {
        close(sockfd);
    }

    struct sockaddr_in GetMavProxyAddress(){
        return mavproxyAddr;
    }
    void SetNodeCountCallback(std::function<void(uint32_t)> callback) {
        nodeCountCallback = callback;
    }

    void ReceiveMessages() {
        uint8_t buffer[1024];
        socklen_t addrLen = sizeof(mavproxyAddr);
        ssize_t recvLen = recvfrom(sockfd, buffer, sizeof(buffer), 0, (struct sockaddr*)&mavproxyAddr, &addrLen);
        if (recvLen > 0) {
            mavlink_message_t msg;
            mavlink_status_t status;
            for (ssize_t i = 0; i < recvLen; ++i) {
                if (mavlink_parse_char(MAVLINK_COMM_0, buffer[i], &msg, &status)) {
                    HandleMessage(msg);
                }
            }
        }
    }

    void HandleMessage(const mavlink_message_t& msg) {
        switch (msg.msgid) {
            case MAVLINK_MSG_ID_HEARTBEAT: {
                mavlink_heartbeat_t heartbeat;
                mavlink_msg_heartbeat_decode(&msg, &heartbeat);
                // Send heartbeat response
                mavlink_message_t response;
                mavlink_msg_heartbeat_pack(system_id, component_id, &response,
                                         MAV_TYPE_GCS,
                                         MAV_AUTOPILOT_INVALID,
                                         0, 0, MAV_STATE_ACTIVE);
                SendMessage(response);
                std::cout << "Received HEARTBEAT from sysid:" << (int)msg.sysid << std::endl;
                break;
            }
            case MAVLINK_MSG_ID_GLOBAL_POSITION_INT: {
                mavlink_global_position_int_t pos;
                mavlink_msg_global_position_int_decode(&msg, &pos);
                // Update node position in simulation
                if (nodeCountCallback) {
                    double lat = pos.lat / 1E7;
                    double lon = pos.lon / 1E7;
                    double alt = pos.alt / 1000.0;
                    std::cout << "Position update from sysid " << (int)msg.sysid 
                              << ": lat=" << lat << " lon=" << lon << " alt=" << alt << std::endl;
                }
                break;
            }
            case MAVLINK_MSG_ID_PARAM_SET: {
                mavlink_param_set_t param_set;
                mavlink_msg_param_set_decode(&msg, &param_set);
                
                // Check if this is our node count parameter
                if (strcmp(param_set.param_id, "NODE_COUNT") == 0) {
                    uint32_t newNodeCount = (uint32_t)param_set.param_value;
                    if (nodeCountCallback) {
                        nodeCountCallback(newNodeCount);
                    }
                    std::cout << "Received new node count: " << newNodeCount << std::endl;
                }
                break;
            }
            default:
                std::cout << "Received message with ID: " << msg.msgid << std::endl;
                break;
        }
    }

    void SendMessage(const mavlink_message_t& msg) {
        uint8_t buffer[1024];
        uint16_t len = mavlink_msg_to_send_buffer(buffer, &msg);
        sendto(sockfd, buffer, len, 0, (struct sockaddr*)&mavproxyAddr, sizeof(mavproxyAddr));
    }
};

#endif // MAVLINK_HANDLER_H
