# Install script for directory: /mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3-dev-core-default.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3-dev-core-default.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3-dev-core-default.so"
         RPATH "/usr/local/lib:$ORIGIN/:$ORIGIN/../lib:/usr/local/lib64:$ORIGIN/:$ORIGIN/../lib64")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/build/lib/libns3-dev-core-default.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3-dev-core-default.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3-dev-core-default.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3-dev-core-default.so"
         OLD_RPATH "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/build/lib:::::::::::::::::"
         NEW_RPATH "/usr/local/lib:$ORIGIN/:$ORIGIN/../lib:/usr/local/lib64:$ORIGIN/:$ORIGIN/../lib64")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libns3-dev-core-default.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ns3" TYPE FILE FILES
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/build/include/ns3/core-config.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/int64x64-128.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/helper/csv-reader.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/helper/event-garbage-collector.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/helper/random-variable-stream-helper.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/abort.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/ascii-file.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/ascii-test.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/assert.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/attribute-accessor-helper.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/attribute-construction-list.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/attribute-container.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/attribute-helper.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/attribute.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/boolean.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/breakpoint.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/build-profile.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/calendar-scheduler.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/callback.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/command-line.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/config.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/default-deleter.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/default-simulator-impl.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/demangle.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/deprecated.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/des-metrics.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/double.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/enum.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/event-id.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/event-impl.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/fatal-error.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/fatal-impl.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/fd-reader.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/environment-variable.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/global-value.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/hash-fnv.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/hash-function.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/hash-murmur3.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/hash.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/heap-scheduler.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/int64x64-double.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/int64x64.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/integer.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/length.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/list-scheduler.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/log-macros-disabled.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/log-macros-enabled.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/log.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/make-event.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/map-scheduler.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/math.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/names.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/node-printer.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/nstime.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/object-base.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/object-factory.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/object-map.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/object-ptr-container.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/object-vector.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/object.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/pair.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/pointer.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/priority-queue-scheduler.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/ptr.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/random-variable-stream.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/rng-seed-manager.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/rng-stream.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/scheduler.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/show-progress.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/shuffle.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/simple-ref-count.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/simulation-singleton.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/simulator-impl.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/simulator.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/singleton.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/string.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/synchronizer.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/system-path.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/system-wall-clock-ms.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/system-wall-clock-timestamp.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/test.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/time-printer.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/timer-impl.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/timer.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/trace-source-accessor.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/traced-callback.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/traced-value.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/trickle-timer.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/tuple.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/type-id.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/type-name.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/type-traits.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/uinteger.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/uniform-random-bit-generator.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/valgrind.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/vector.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/warnings.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/watchdog.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/realtime-simulator-impl.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/wall-clock-synchronizer.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/val-array.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/src/core/model/matrix-array.h"
    "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/ns-3-dev/build/include/ns3/core-module.h"
    )
endif()

