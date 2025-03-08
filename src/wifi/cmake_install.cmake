# Install script for directory: /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "default")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3-dev-wifi-default.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3-dev-wifi-default.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3-dev-wifi-default.so"
         RPATH "/usr/local/lib:$ORIGIN/:$ORIGIN/../lib:/usr/local/lib64:$ORIGIN/:$ORIGIN/../lib64")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/build/lib/libns3-dev-wifi-default.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3-dev-wifi-default.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3-dev-wifi-default.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3-dev-wifi-default.so"
         OLD_RPATH "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/build/lib:::::::::::::::::"
         NEW_RPATH "/usr/local/lib:$ORIGIN/:$ORIGIN/../lib:/usr/local/lib64:$ORIGIN/:$ORIGIN/../lib64")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3-dev-wifi-default.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ns3" TYPE FILE FILES
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/helper/athstats-helper.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/helper/spectrum-wifi-helper.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/helper/wifi-co-trace-helper.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/helper/wifi-helper.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/helper/wifi-mac-helper.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/helper/wifi-radio-energy-model-helper.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/helper/yans-wifi-helper.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/helper/wifi-phy-rx-trace-helper.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/helper/wifi-tx-stats-helper.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/addba-extension.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/adhoc-wifi-mac.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/ampdu-subframe-header.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/ampdu-tag.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/amsdu-subframe-header.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/ap-wifi-mac.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/block-ack-agreement.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/block-ack-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/block-ack-type.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/block-ack-window.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/capability-information.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/channel-access-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/ctrl-headers.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/edca-parameter-set.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/advanced-ap-emlsr-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/advanced-emlsr-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/ap-emlsr-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/common-info-basic-mle.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/common-info-probe-req-mle.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/default-ap-emlsr-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/default-emlsr-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/eht-capabilities.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/eht-configuration.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/eht-frame-exchange-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/eht-operation.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/tid-to-link-mapping-element.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/eht-phy.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/eht-ppdu.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/emlsr-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/eht/multi-link-element.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/error-rate-model.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/extended-capabilities.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/fcfs-wifi-queue-scheduler.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/frame-capture-model.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/frame-exchange-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/gcr-group-address.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/gcr-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/he/constant-obss-pd-algorithm.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/he/he-6ghz-band-capabilities.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/he/he-capabilities.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/he/he-configuration.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/he/he-frame-exchange-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/he/he-operation.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/he/he-phy.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/he/he-ppdu.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/he/he-ru.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/he/mu-edca-parameter-set.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/he/mu-snr-tag.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/he/multi-user-scheduler.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/he/obss-pd-algorithm.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/he/rr-multi-user-scheduler.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/ht/ht-capabilities.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/ht/ht-configuration.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/ht/ht-frame-exchange-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/ht/ht-operation.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/ht/ht-phy.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/ht/ht-ppdu.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/interference-helper.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/mac-rx-middle.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/mac-tx-middle.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/mgt-action-headers.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/mgt-headers.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/mpdu-aggregator.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/msdu-aggregator.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/nist-error-rate-model.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/non-ht/dsss-error-rate-model.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/non-ht/dsss-parameter-set.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/non-ht/dsss-phy.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/non-ht/dsss-ppdu.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/non-ht/erp-information.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/non-ht/erp-ofdm-phy.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/non-ht/erp-ofdm-ppdu.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/non-ht/ofdm-phy.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/non-ht/ofdm-ppdu.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/non-inheritance.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/originator-block-ack-agreement.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/phy-entity.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/preamble-detection-model.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/qos-frame-exchange-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/qos-txop.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/qos-utils.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/rate-control/aarf-wifi-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/rate-control/aarfcd-wifi-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/rate-control/amrr-wifi-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/rate-control/aparf-wifi-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/rate-control/arf-wifi-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/rate-control/cara-wifi-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/rate-control/constant-rate-wifi-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/rate-control/ideal-wifi-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/rate-control/minstrel-ht-wifi-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/rate-control/minstrel-wifi-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/rate-control/onoe-wifi-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/rate-control/parf-wifi-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/rate-control/rraa-wifi-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/rate-control/rrpaa-wifi-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/rate-control/thompson-sampling-wifi-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/recipient-block-ack-agreement.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/reduced-neighbor-report.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/reference/error-rate-tables.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/simple-frame-capture-model.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/snr-tag.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/spectrum-wifi-phy.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/ssid.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/sta-wifi-mac.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/status-code.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/supported-rates.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/table-based-error-rate-model.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/threshold-preamble-detection-model.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/tim.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/txop.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/vht/vht-capabilities.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/vht/vht-configuration.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/vht/vht-frame-exchange-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/vht/vht-operation.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/vht/vht-phy.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/vht/vht-ppdu.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-ack-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-acknowledgment.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-assoc-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-bandwidth-filter.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-default-ack-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-default-assoc-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-default-gcr-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-default-protection-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-information-element.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-mac-header.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-mac-queue-container.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-mac-queue-elem.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-mac-queue-scheduler-impl.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-mac-queue-scheduler.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-mac-queue.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-mac-trailer.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-mac.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-mgt-header.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-mode.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-mpdu.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-net-device.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-opt-field.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-phy-band.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-phy-common.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-phy-listener.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-phy-operating-channel.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-phy-state-helper.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-phy-state.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-phy.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-ppdu.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-protection-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-protection.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-psdu.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-radio-energy-model.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-remote-station-info.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-remote-station-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-spectrum-phy-interface.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-spectrum-signal-parameters.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-standards.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-tx-current-model.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-tx-parameters.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-tx-timer.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-tx-vector.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-types.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-units.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-utils.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/yans-error-rate-model.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/yans-wifi-channel.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/yans-wifi-phy.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/model/wifi-spectrum-value-helper.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/wifi/test/wifi-mlo-test.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/build/include/ns3/wifi-module.h"
    )
endif()

