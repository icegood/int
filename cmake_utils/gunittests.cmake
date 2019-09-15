add_subdirectory("/usr/src/googletest" ${CMAKE_BINARY_DIR}/gtest)

function(add_tests_target subproject_name subproject_libs)
  file(GLOB_RECURSE TEST_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} ./tests/*.cpp)
  message(STATUS "enabling test target for ${subproject_name}")

  add_executable(${subproject_name}_test ${TEST_FILES})
  target_include_directories (${subproject_name}_test PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include ${GTEST_INCLUDE_DIRS})
  add_dependencies(${subproject_name}_test ${subproject_name})
  target_link_libraries(${subproject_name}_test ${subproject_libs} gtest gtest_main)
  add_test(${subproject_name}_test ${subproject_name}_test)
endfunction(add_tests_target)
