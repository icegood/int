cmake_minimum_required(VERSION 3.6.2)
project(proj_lib)

set (INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
set (SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)

set(PROJECT_SOURCES
    ${SOURCE_DIR}/${PROJECT_NAME}.cpp
)

include(project_specific)

add_library(${PROJECT_NAME} STATIC ${PROJECT_SOURCES})
target_include_directories (${PROJECT_NAME} PUBLIC ${INCLUDE_DIR})
# unit tests
add_tests_target(${PROJECT_NAME})
# gprof
add_gprof_target(${PROJECT_NAME})
