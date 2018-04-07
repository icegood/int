# Function to link between sub-projects
function(add_dependent_subproject subproject_name)
    if(NOT PROJECT_${subproject_name})
      # var unknown because we build only ${PROJECT_NAME} and ${subproject_name} hasn't been built yet
      # find_package(${subproject_name} CONFIG REQUIRED)
      add_subdirectory(../${subproject_name} ../${subproject_name})
    endif()
    set(${PROJECT_NAME}_SOURCE_DIRS_OWN ${${PROJECT_NAME}_SOURCE_DIRS_OWN} ${${subproject_name}_SOURCE_DIRS_OUT} PARENT_SCOPE)
endfunction(add_dependent_subproject)

# project specific parameters :
function(configure_additional_options)
  include(${CMAKE_CURRENT_SOURCE_DIR}/cmake_utils/${PROJECT_NAME}_options.cmake)
  configure_file( ./include/${PROJECT_NAME}_options.h.in ${PROJECT_NAME}_options.h @ONLY)
  target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
endfunction(configure_additional_options)

# project executable confguration
function(configure_project_executable)
  set (SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
  set (INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
  
  set(PROJEXEC_SRCS 
      ${SOURCE_DIR}/${PROJECT_NAME}.cpp
  )
  set(${PROJECT_NAME}_SOURCE_DIRS_OWN ${SOURCE_DIR})
  add_dependent_subproject(proj_lib)
  set(${PROJECT_NAME}_SOURCE_DIRS_OUT ${${PROJECT_NAME}_SOURCE_DIRS_OWN} PARENT_SCOPE)
  
  add_executable(${PROJECT_NAME} ${PROJEXEC_SRCS})
  target_include_directories(${PROJECT_NAME} PRIVATE ${INCLUDE_DIR})
  configure_additional_options()
  
  target_link_libraries (${PROJECT_NAME} proj_lib)
  
  add_gdb_target()
endfunction(configure_project_executable)

# Make sure we tell the topdir CMakeLists that we exist (if build from topdir)
get_directory_property(hasParent PARENT_DIRECTORY)

if(hasParent)
  set(PROJECT_${PROJECT_NAME} true PARENT_SCOPE)
endif()

