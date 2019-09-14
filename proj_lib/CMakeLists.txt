cmake_minimum_required(VERSION 3.13.4)
project(proj_lib)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/../cmake_utils)
include(project_specific)
add_library(${PROJECT_NAME} STATIC src/${PROJECT_NAME}.cpp)
configure_project_common()

target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
