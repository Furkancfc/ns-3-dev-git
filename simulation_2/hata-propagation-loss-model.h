#ifndef HATA_PROPAGATION_LOSS_MODEL_H
#define HATA_PROPAGATION_LOSS_MODEL_H

#include "ns3/propagation-loss-model.h"

namespace ns3 {
class HataPropagationLossModel : public PropagationLossModel {
public:
    static TypeId GetTypeId(void);
    HataPropagationLossModel();
    
protected:
    virtual double DoCalcRxPower(double txPowerDbm, Ptr<MobilityModel> a, Ptr<MobilityModel> b) const;
    virtual int64_t DoAssignStreams(int64_t stream);
};
} // namespace ns3

#endif // HATA_PROPAGATION_LOSS_MODEL_H
