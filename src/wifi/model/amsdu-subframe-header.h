/*
 * Copyright (c) 2009 MIRKO BANCHI
 *
 * SPDX-License-Identifier: GPL-2.0-only
 *
 * Author: Mirko Banchi <mk.banchi@gmail.com>
 */

#ifndef AMSDU_SUBFRAME_HEADER_H
#define AMSDU_SUBFRAME_HEADER_H

#include "ns3/header.h"
#include "ns3/mac48-address.h"

namespace ns3
{

/**
 * @ingroup wifi
 * @brief Headers for A-MSDU subframes
 */
class AmsduSubframeHeader : public Header
{
  public:
    AmsduSubframeHeader();
    ~AmsduSubframeHeader() override;

    /**
     * @brief Get the type ID.
     * @return the object TypeId
     */
    static TypeId GetTypeId();

    TypeId GetInstanceTypeId() const override;
    void Print(std::ostream& os) const override;
    uint32_t GetSerializedSize() const override;
    void Serialize(Buffer::Iterator start) const override;
    uint32_t Deserialize(Buffer::Iterator start) override;

    /**
     * Set destination address function
     * @param to the destination MAC address
     */
    void SetDestinationAddr(Mac48Address to);
    /**
     * Set source address function
     * @param to the source MAC address
     */
    void SetSourceAddr(Mac48Address to);
    /**
     * Set length function
     * @param length the length in bytes
     */
    void SetLength(uint16_t length);
    /**
     * Get destination address function
     * @returns the destination MAC address
     */
    Mac48Address GetDestinationAddr() const;
    /**
     * Get source address function
     * @returns the source MAC address
     */
    Mac48Address GetSourceAddr() const;
    /**
     * Get length function
     * @returns the length in bytes
     */
    uint16_t GetLength() const;

  private:
    Mac48Address m_da; ///< destination address
    Mac48Address m_sa; ///< source address
    uint16_t m_length; ///< length in bytes
};

} // namespace ns3

#endif /* AMSDU_SUBFRAME_HEADER_H */
