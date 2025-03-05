# Disable pedantic warnings for MAVLink-related files
function(disable_mavlink_warnings target)
  if(TARGET ${target})
    target_compile_options(${target} PRIVATE
      -Wno-pedantic
      -Wno-address-of-packed-member
    )
  endif()
endfunction()

# Add MAVLink include directories
function(add_mavlink_includes target)
  if(TARGET ${target})
    target_include_directories(${target} PRIVATE
      ${CMAKE_SOURCE_DIR}/src/mavlink
      ${CMAKE_SOURCE_DIR}/src/mavlink/v2.0
    )
  endif()
endfunction()
