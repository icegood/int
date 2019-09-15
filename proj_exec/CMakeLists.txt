cmake_minimum_required(VERSION 3.13.4)
include(${CMAKE_CURRENT_SOURCE_DIR}/../cmake_utils/project_prolog.cmake)
project(proj_exec)

set(PROJECT_LINK_LIBS proj_lib)
include(project_specific)
add_executable(${PROJECT_NAME} src/${PROJECT_NAME}.cpp)
configure_project_common()

if(ParentDir STREQUAL "")
  add_subdirectory(../proj_lib ${CMAKE_CURRENT_BINARY_DIR}/proj_lib)
endif()
target_link_libraries(${PROJECT_NAME} PRIVATE proj_lib)
