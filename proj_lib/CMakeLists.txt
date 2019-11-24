include(${CMAKE_CURRENT_SOURCE_DIR}/../cmake_utils/project_prolog.cmake)
project(proj_lib)

add_library(${PROJECT_NAME} STATIC)
target_sources(${PROJECT_NAME} PRIVATE src/${PROJECT_NAME}.cpp)

set(${PROJECT_NAME}_test_sources
  tests/test_lib.cpp)


include(project_specific)
configure_project_common()

target_link_libraries(${PROJECT_NAME}_test PRIVATE ${PROJECT_NAME})

target_include_directories(${PROJECT_NAME} PUBLIC
  $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include>
  $<BUILD_INTERFACE:${${PROJECT_NAME}_BINARY_DIR}/include>
  $<INSTALL_INTERFACE:include>
)
