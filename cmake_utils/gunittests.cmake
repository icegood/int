function(add_tests_target subproject_name)
  file(GLOB_RECURSE TEST_FILES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} ./tests/*.cpp)
  add_executable(${subproject_name}_test ${TEST_FILES} ${PROJECT_SOURCES})
  target_include_directories (${subproject_name}_test PRIVATE ${INCLUDE_DIR})
  
  add_dependencies(${subproject_name}_test ${subproject_name})
  
  #target_link_libraries(${subproject_name}_test, gmock gunit)
  
  add_test(${subproject_name}_test ${subproject_name}_test)
endfunction(add_tests_target)