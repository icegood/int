# editor/viewer to see result of profilers
set(cusom_viewer gedit CACHE STRING "viewer for profile results")
# gprof compatible
option(ENABLE_GPROF "enable code for gprof profiling" OFF)
if (ENABLE_GPROF)
  add_definitions(-DPROFILING)
endif()

option(common_def "Some common option to be add to include" OFF)

if (common_def)
  add_definitions(-Dcommon_def)
endif()

