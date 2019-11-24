include(${CMAKE_CURRENT_SOURCE_DIR}/../cmake_utils/project_prolog.cmake)
project(proj_exec)

add_executable(${PROJECT_NAME})
target_sources(${PROJECT_NAME} PRIVATE src/${PROJECT_NAME}.cpp)

set(${PROJECT_NAME}_test_sources
  )

include(project_specific)
configure_project_common()

target_link_libraries(${PROJECT_NAME} PRIVATE proj_lib)
