# ideas are taken from https://github.com/epam/nfstrace/blob/master/cmake/valgrind.cmake
function(add_valgring_targets subproject_name)
  find_program (VALGRIND_PATH valgrind)
  
  if (VALGRIND_PATH)
    set (vg_mem_target ${subproject_name}_vg_memcheck)
    add_custom_target (${vg_mem_target})
    set (vg_sgcheck_target ${subproject_name}_vg_sgcheck)
    add_custom_target (${vg_sgcheck_target})
    set (vg_cachegrind_target ${subproject_name}_vg_cachegrind)
    add_custom_target (${vg_cachegrind_target})
    set (vg_callgrind_target ${subproject_name}_vg_callgrind)
    add_custom_target (${vg_callgrind_target})
    #set (vg_helgrind_target ${subproject_name}_vg_helgrind)
    #add_custom_target (${vg_helgrind_target})
    
    set(prog_to_profile ${subproject_name}_test)
    foreach (trg ${vg_mem_target} ${vg_sgcheck_target} ${vg_cachegrind_target} ${vg_callgrind_target} ${vg_helgrind_target})
      # valgrind reports should work against test files:
      add_dependencies (${trg} ${prog_to_profile})
    endforeach ()
    
    # Memcheck report
    add_custom_command (TARGET ${vg_mem_target}
      POST_BUILD
      COMMAND valgrind --tool=memcheck --leak-check=full --track-origins=yes -v -v -v --show-reachable=yes .\
        ${prog_to_profile} 2> ${subproject_name}_vg_memcheck_out
      COMMAND ${cusom_viewer} ${subproject_name}_vg_memcheck_out)
    
    # exp-sgcheck report
    add_custom_command (TARGET ${vg_sgcheck_target}
      POST_BUILD
      COMMAND valgrind --tool=memcheck --leak-check=full --track-origins=yes -v -v -v --show-reachable=yes \
        ${prog_to_profile} 2> ${subproject_name}vg_sgcheck_out
      COMMAND ${cusom_viewer} ${subproject_name}vg_sgcheck_out)
    
    # cachegrind/callgrind:
    find_program (KCACHEGRIND_PATH kcachegrind)
    if (KCACHEGRIND_PATH)
      add_custom_command (TARGET ${vg_cachegrind_target}
        POST_BUILD
        COMMAND valgrind --tool=cachegrind --cachegrind-out-file=${subproject_name}vg_cachegrind_out \
          --branch-sim=yes --cache-sim=yes ${prog_to_profile}
        COMMAND kcachegrind ${subproject_name}vg_cachegrind_out)
      add_custom_command (TARGET ${vg_callgrind_target}
        POST_BUILD
        COMMAND valgrind --tool=callgrind --callgrind-out-file=${subproject_name}vg_callgrind_out \
          --dump-line=no --dump-instr=yes --collect-jumps=yes --collect-systime=yes --collect-bus=yes ${prog_to_profile}
        COMMAND kcachegrind ${subproject_name}vg_callgrind_out)
    endif ()
  endif ()
endfunction(add_valgring_targets)