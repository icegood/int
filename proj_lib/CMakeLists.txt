cmake_minimum_required(VERSION 3.13)
include(${CMAKE_CURRENT_SOURCE_DIR}/../cmake_utils/project_prolog.cmake)
project(proj_lib)

set(PROJECT_LINK_LIBS ${PROJECT_NAME})
include(project_specific)
add_library(${PROJECT_NAME} STATIC src/${PROJECT_NAME}.cpp)
configure_project_common()

target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
