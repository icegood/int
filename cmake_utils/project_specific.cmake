function(configure_additional_options)
  if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/include/${PROJECT_NAME}_options.h.in)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake_utils/${PROJECT_NAME}_options.cmake)
    configure_file( ./include/${PROJECT_NAME}_options.h.in ${PROJECT_NAME}_options.h @ONLY)
    target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
  endif()
endfunction(configure_additional_options)

function(configure_project_tools)
  # gdb
  include(gdb)
  add_gdb_target()
  # unit tests
  enable_testing()
  include(gunittests)
  add_tests_target(${PROJECT_NAME})
  # gprof
  include(gprof)
  add_gprof_target(${PROJECT_NAME})
endfunction(configure_project_tools)

function(configure_project_common)
  set (SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
  set (INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)

  target_include_directories(${PROJECT_NAME} PRIVATE ${INCLUDE_DIR})
  configure_additional_options()
  if(!hasParent)
    configure_project_tools(${PROJECT_NAME})
  endif()
endfunction(configure_project_common)

# Make sure we tell the topdir CMakeLists that we exist (if build from topdir)
get_directory_property(hasParent PARENT_DIRECTORY)

#if(hasParent)
#  set(PROJECT_${PROJECT_NAME} true PARENT_SCOPE)
#endif()

