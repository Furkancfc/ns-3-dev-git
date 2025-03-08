message(STATUS "Processing simulation_1/CMakeLists.txt")

# Set MAVLink paths
set(MAVLINK_ROOT "/mnt/nvme0n1p6/Klasorler/Dersler/BitirmeProje/mavlink" CACHE PATH "MAVLink root directory")
set(MAVLINK_INCLUDE_DIRS "${MAVLINK_ROOT}/generated/include")

# Debug output
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

message(STATUS "Found MAVLink headers at: ${MAVLINK_INCLUDE_DIR}")
message(STATUS "CMAKE_BINARY_DIR    :   ${CMAKE_BINARY_DIR}")

# Set executable name
set(EXECUTABLE_NAME simulation_1)
set(EXECUTABLE_PREFIX )
set(EXECUTABLE_OUTPUT_DIR ${CMAKE_BINARY_DIR}/simulation_1)

message(STATUS "Building ${EXECUTABLE_NAME} example to ${EXECUTABLE_OUTPUT_DIR}")

# Add executable
add_executable(${EXECUTABLE_PREFIX}${EXECUTABLE_NAME} ${CMAKE_CURRENT_SOURCE_DIR}/${EXECUTABLE_NAME}.cc)

# Link libraries
target_link_libraries(${EXECUTABLE_PREFIX}${EXECUTABLE_NAME} ${ns3-libs})

# Include directories
target_include_directories(${EXECUTABLE_PREFIX}${EXECUTABLE_NAME} PRIVATE ${MAVLINK_INCLUDE_DIR})

# Set output directory and name
set_target_properties(${EXECUTABLE_PREFIX}${EXECUTABLE_NAME} PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${EXECUTABLE_OUTPUT_DIR}
    OUTPUT_NAME ${EXECUTABLE_PREFIX}${EXECUTABLE_NAME}
)

# Disable -Werror for this target
target_compile_options(${EXECUTABLE_PREFIX}${EXECUTABLE_NAME} PRIVATE -Wno-error)

# Add custom target to run the executable
add_custom_target(run-simulation_1
    COMMAND ${EXECUTABLE_OUTPUT_DIR}/${EXECUTABLE_PREFIX}${EXECUTABLE_NAME}
    DEPENDS ${EXECUTABLE_PREFIX}${EXECUTABLE_NAME}
    WORKING_DIRECTORY ${EXECUTABLE_OUTPUT_DIR}
    COMMENT "Running MAVLink simulation..."
)
