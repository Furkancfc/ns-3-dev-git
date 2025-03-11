#include "hata-propagation-loss-model.h"
#include "ns3/log.h"
#include "ns3/mobility-model.h"
#include <cmath>

NS_LOG_COMPONENT_DEFINE("HataPropagationLossModel");

namespace ns3 {

NS_OBJECT_ENSURE_REGISTERED(HataPropagationLossModel);

TypeId HataPropagationLossModel::GetTypeId(void) {
    static TypeId tid = TypeId("ns3::HataPropagationLossModel")
        .SetParent<PropagationLossModel>()
        .SetGroupName("Propagation");
    return tid;
}

HataPropagationLossModel::HataPropagationLossModel() {}

double HataPropagationLossModel::DoCalcRxPower(double txPowerDbm, Ptr<MobilityModel> a, Ptr<MobilityModel> b) const {
    double frequency = 900; // MHz
    double distance = a->GetDistanceFrom(b) / 1000.0; // Convert to km
    double ht = 50; // Transmitter height (m)
    double hr = 10; // Receiver height (m)
    
    double a_hr = (1.1 * log10(frequency) - 0.7) * hr - (1.56 * log10(frequency) - 0.8);
    double pathLoss = 69.55 + 26.16 * log10(frequency) - 13.82 * log10(ht) - a_hr + (44.9 - 6.55 * log10(ht)) * log10(distance);
    
    return txPowerDbm - pathLoss;
}

int64_t HataPropagationLossModel::DoAssignStreams(int64_t stream) {
    return 0;
}

} // namespace ns3
