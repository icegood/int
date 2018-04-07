cmake_minimum_required(VERSION 3.6.2)
project(proj_lib)

set (INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
set (SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)

set(PROJECT_SOURCES
    ${SOURCE_DIR}/proj_lib.cpp
)

include(project_specific)
set(${PROJECT_NAME}_SOURCE_DIRS_OUT ${${PROJECT_NAME}_SOURCE_DIRS_OWN} PARENT_SCOPE)

add_library(proj_lib STATIC ${PROJECT_SOURCES})
target_include_directories (proj_lib PUBLIC ${INCLUDE_DIR})
# unit tests
add_tests_target(proj_lib)
# gprof
add_gprof_target(proj_lib)