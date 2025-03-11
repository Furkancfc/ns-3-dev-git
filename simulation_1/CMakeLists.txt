set(PROJECT_NAME simulation_1)
set(EXECUTABLE_PREFIX )
set(EXECUTABLE_NAME main)
# Set MAVLink paths
set(MAVLINK_ROOT "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/mavlink" CACHE PATH "MAVLink root directory")
set(MAVLINK_INCLUDE_DIRS "${MAVLINK_ROOT}/generated/include")

# Debug output
message(STATUS "Current Source Dir: ${CMAKE_CURRENT_SOURCE_DIR}")
message(STATUS "Looking for MAVLink headers in: ${MAVLINK_INCLUDE_DIRS}")
# Search for MAVLink headers
find_path(MAVLINK_INCLUDE_DIR
    NAMES
        mavlink/common/mavlink.h
        mavlink/v2.0/common/mavlink.h
    PATHS
        ${MAVLINK_INCLUDE_DIRS}
        /usr/include
        /usr/local/include
        ${CMAKE_SOURCE_DIR}/src
    NO_DEFAULT_PATH
)

if(NOT MAVLINK_INCLUDE_DIR)
    message(FATAL_ERROR
        "MAVLink headers not found. Please:\n"
        "1. Generate MAVLink headers:\n"
        "   cd ${MAVLINK_ROOT}\n"
        "   python3 -m pymavlink.tools.mavgen --lang=C --wire-protocol=2.0 --output=generated/include/mavlink/v2.0 message_definitions/v1.0/common.xml\n"
        "2. Or set MAVLINK_ROOT to your MAVLink installation directory"
    )
endif()
set(ALL_INCLUDE_DIRS
    ${MAVLINK_INCLUDE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
)
message(STATUS "Found MAVLink headers at: ${MAVLINK_INCLUDE_DIR}")
include(../CMakeTemplate.txt)