function(configure_additional_options)
  if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/include/${PROJECT_NAME}_options.h.in)
    include(${CMAKE_CURRENT_SOURCE_DIR}/cmake_utils/${PROJECT_NAME}_options.cmake)
    configure_file( ./include/${PROJECT_NAME}_options.h.in ${PROJECT_NAME}_options.h @ONLY)
    target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
  endif()
endfunction(configure_additional_options)

enable_testing()
find_package(GTest REQUIRED)

function(configure_project_tools)
  # gdb
  include(gdb)
  add_gdb_target()
  # unit tests
  enable_testing()
  add_executable(${PROJECT_NAME}_test)
  target_link_libraries(${PROJECT_NAME}_test GTest::GTest GTestMain::GTestMain)
  gtest_add_tests(${PROJECT_NAME} "${PROJECT_LINK_LIBS}")
  # gprof
  include(gprof)
  add_gprof_target(${PROJECT_NAME})
endfunction(configure_project_tools)

function(configure_project_common)
  target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)
  configure_additional_options()
  if(ParentDir STREQUAL "")
    configure_project_tools()
  endif()
endfunction(configure_project_common)

# Make sure we tell the topdir CMakeLists that we exist (if build from topdir)
get_directory_property(ParentDir PARENT_DIRECTORY)

