#ifndef MAVLINK_HANDLER_H
#define MAVLINK_HANDLER_H

#include <mavlink/v2.0/common/mavlink.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <unistd.h>
#include <iostream>

class MavlinkHandler {
private:
    int sockfd;
    struct sockaddr_in mavproxyAddr;

public:
    MavlinkHandler(const std::string& ip, uint16_t port) {
        sockfd = socket(AF_INET, SOCK_DGRAM, 0);
        if (sockfd < 0) {
            std::cerr << "Failed to create socket" << std::endl;
            exit(EXIT_FAILURE);
        }

        mavproxyAddr.sin_family = AF_INET;
        mavproxyAddr.sin_port = htons(port);
        inet_pton(AF_INET, ip.c_str(), &mavproxyAddr.sin_addr);
    }

    ~MavlinkHandler() {
        close(sockfd);
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
        // Handle different MAVLink messages here
        switch (msg.msgid) {
            case MAVLINK_MSG_ID_HEARTBEAT:
                std::cout << "Received HEARTBEAT message" << std::endl;
                break;
            // Add more cases to handle other MAVLink messages
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
