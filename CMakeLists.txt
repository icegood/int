cmake_minimum_required(VERSION 3.6.2)
project(MainProj CXX)

set(CMAKE_LEGACY_CYGWIN_WIN32 0)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake_utils)

include(options)
include(gprof)
# tests:
enable_testing()
include(gunittests)
# Add sub-directories
add_subdirectory(proj_lib)
add_subdirectory(proj_exec)