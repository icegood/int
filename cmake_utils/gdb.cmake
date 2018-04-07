# ideas are taken from https://github.com/epam/nfstrace/blob/master/cmake/valgrind.cmake
function(add_gdb_target)
  set(l Debug RelWithDebInfo)
  if (${CMAKE_BUILD_TYPE} IN_LIST l)
    message(STATUS "enabling gdb target for " ${PROJECT_NAME})
    
    find_program (GDB_PATH gdb)
    
    if (GDB_PATH)
      set(GDB_TARGET ${PROJECT_NAME}_gdb)
      add_custom_target (${GDB_TARGET})
      add_dependencies(${GDB_TARGET} ${PROJECT_NAME})
      
      set(GDB_SOURCE_DIRS )
      foreach(SRC_PATH ${${PROJECT_NAME}_SOURCE_DIRS_OWN})
        set(GDB_SOURCE_DIRS ${GDB_SOURCE_DIRS} "--directory=${SRC_PATH}")
      endforeach()
      add_custom_command (
        TARGET ${GDB_TARGET}
        POST_BUILD
        COMMAND gdb ${PROJECT_NAME} ${GDB_SOURCE_DIRS})
    endif()
  endif()
endfunction(add_gdb_target)