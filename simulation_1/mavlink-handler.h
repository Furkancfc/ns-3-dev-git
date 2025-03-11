#ifndef MAVLINK_HANDLER_H
#define MAVLINK_HANDLER_H

#include <functional>
#include <iostream>
#include <optional>
#include <cstring>
#include <arpa/inet.h>
#include <mavlink/v2.0/common/mavlink.h>

class MavlinkHandler {
private:
    int sockfd;
    sockaddr_in mavproxyAddr;
    std::function<void(uint32_t)> nodeCountCallback;
    uint8_t system_id;
    uint8_t component_id;
    bool receivedHeartbeat = false;

public:
    MavlinkHandler(const std::string& ip, uint16_t port) {
        sockfd = socket(AF_INET, SOCK_DGRAM, 0);
        if (sockfd < 0) {
            perror("socket creation failed");
            exit(EXIT_FAILURE);
        }

        memset(&mavproxyAddr, 0, sizeof(mavproxyAddr));
        mavproxyAddr.sin_family = AF_INET;
        mavproxyAddr.sin_port = htons(port);
        inet_pton(AF_INET, ip.c_str(), &mavproxyAddr.sin_addr);

        if (bind(sockfd, (const struct sockaddr *)&mavproxyAddr, sizeof(mavproxyAddr)) < 0) {
            perror("bind failed");
            exit(EXIT_FAILURE);
        }

        std::cout << "MavlinkHandler initialized on " << ip << ":" << port << std::endl;
    }

    ~MavlinkHandler() {
        ::close(sockfd);
    }

    void SetNodeCountCallback(std::function<void(uint32_t)> callback) {
        nodeCountCallback = callback;
    }

    bool HasReceivedHeartbeat() const {
        return receivedHeartbeat;
    }

    std::optional<mavlink_message_t> ReceiveMessages() {
        mavlink_message_t msg;
        mavlink_status_t status;
        uint8_t buf[2048];
        ssize_t len = recv(sockfd, buf, sizeof(buf), MSG_DONTWAIT);
        if (len > 0) {
            for (ssize_t i = 0; i < len; ++i) {
                if (mavlink_parse_char(MAVLINK_COMM_0, buf[i], &msg, &status)) {
                    return msg;
                }
            }
        }
        return std::nullopt;
    }

    void HandleMessage(const mavlink_message_t& msg) {
        switch (msg.msgid) {
            case MAVLINK_MSG_ID_HEARTBEAT: {
                mavlink_heartbeat_t heartbeat;
                mavlink_msg_heartbeat_decode(&msg, &heartbeat);
                receivedHeartbeat = true; // Set flag when heartbeat is received
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
        uint8_t buf[MAVLINK_MAX_PACKET_LEN];
        uint16_t len = mavlink_msg_to_send_buffer(buf, &msg);
        sendto(sockfd, buf, len, 0, (const struct sockaddr *)&mavproxyAddr, sizeof(mavproxyAddr));
    }

    sockaddr_in GetMavProxyAddress() const {
        return mavproxyAddr;
    }
};

#endif