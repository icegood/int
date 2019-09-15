if (ENABLE_GPROF)
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pg")
endif()

# ideas are taken from https://github.com/epam/nfstrace/blob/master/cmake/valgrind.cmake
function(add_gprof_target subproject_name)
  if (ENABLE_GPROF)
    message(STATUS "enabling gprof target for " ${PROJECT_NAME})
    find_program (GPROF_PATH gprof)
    
    if (GPROF_PATH)
      set(GPROF_TARGET ${subproject_name}_gprof)
      add_custom_target (${GPROF_TARGET})
      add_dependencies(${GPROF_TARGET} ${subproject_name}_test)
      add_custom_command (
        TARGET ${GPROF_TARGET}
        PRE_BUILD
        COMMAND ${subproject_name}_test)
       
      add_custom_command (
        TARGET ${GPROF_TARGET}
        POST_BUILD
        COMMAND gprof ${subproject_name}_test gmon.out > ${GPROF_TARGET}
        COMMAND ${cusom_viewer} ${GPROF_TARGET})
    endif()
  endif()
endfunction(add_gprof_target)
