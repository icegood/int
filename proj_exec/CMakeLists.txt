cmake_minimum_required(VERSION 3.6.2)
project(proj_exec)

set (SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
set (INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)

set(PROJEXEC_SRCS 
    ${SOURCE_DIR}/proj_exec.cpp
)

include(proj_dependencies)

add_dependent_subproject(proj_lib)
set(${PROJECT_NAME}_SOURCE_DIRS_OUT ${${PROJECT_NAME}_SOURCE_DIRS_OWN} PARENT_SCOPE)

add_executable(proj_exec ${PROJEXEC_SRCS})
target_include_directories(proj_exec PRIVATE ${INCLUDE_DIR})

target_link_libraries (proj_exec proj_lib)

add_gdb_target(proj_exec)