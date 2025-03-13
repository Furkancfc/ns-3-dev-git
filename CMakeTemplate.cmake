set(THIS_TARGET ${PROJECT_NAME})
message(STATUS "Processing ${THIS_TARGET}")
set(EXECUTABLE_OUTPUT_DIR ${CMAKE_BINARY_DIR}/${PROJECT_NAME})
# Ensure the output directory exists
file(MAKE_DIRECTORY ${EXECUTABLE_OUTPUT_DIR})

# Add executable
add_executable(${THIS_TARGET} ${CMAKE_CURRENT_SOURCE_DIR}/${EXECUTABLE_NAME}.cc)

# Link libraries
target_link_libraries(${THIS_TARGET} ${ns3-libs})

# Include directories
target_include_directories(${THIS_TARGET} PRIVATE ${ALL_INCLUDE_DIRS})
# Set output directory and name
set_target_properties(
    ${THIS_TARGET}
    PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${EXECUTABLE_OUTPUT_DIR}
    OUTPUT_NAME ${EXECUTABLE_PREFIX}${EXECUTABLE_NAME}
)

# Disable -Werror for this target
target_compile_options(${THIS_TARGET} PRIVATE -Wno-error)
# Add custom target to run the executable
add_custom_target(run-${PROJECT_NAME}
    COMMAND ${THIS_TARGET}
    COMMAND ${EXECUTABLE_OUTPUT_DIR}/${EXECUTABLE_PREFIX}${EXECUTABLE_NAME}
    DEPENDS ${EXECUTABLE_PREFIX}${EXECUTABLE_NAME}
    WORKING_DIRECTORY ${EXECUTABLE_OUTPUT_DIR}
    COMMENT "Running ${PROJECT_NAME}..."
)
add_custom_target(
    clean-${PROJECT_NAME}
    COMMAND ${CMAKE_COMMAND} -E remove_directory ${EXECUTABLE_OUTPUT_DIR}
    COMMENT "Cleaning up ${EXECUTABLE_OUTPUT_DIR}"
)