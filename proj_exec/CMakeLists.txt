cmake_minimum_required(VERSION 3.6.2)
project(proj_exec)

set (PROJEXEC_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
set (PROJEXEC_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)

set(PROJEXEC_SRCS 
    ${PROJEXEC_SOURCE_DIR}/proj_exec.cpp
)

include(proj_dependencies)

add_dependent_subproject(proj_lib)
add_executable(proj_exec ${PROJEXEC_SRCS})
target_include_directories(proj_exec PRIVATE ${CMAKE_CURRENT_LIST_DIR}/include)

target_link_libraries (proj_exec proj_lib)