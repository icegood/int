# Function to link between sub-projects
function(add_dependent_subproject subproject_name)
    if(NOT PROJECT_${subproject_name})
      # var unknown because we build only ${PROJECT_NAME} and ${subproject_name} hasn't been built yet
      # find_package(${subproject_name} CONFIG REQUIRED)
      add_subdirectory(../${subproject_name} ../${subproject_name})
    endif()
    set(${PROJECT_NAME}_SOURCE_DIRS_OWN ${${PROJECT_NAME}_SOURCE_DIRS_OWN} ${${subproject_name}_SOURCE_DIRS_OUT} PARENT_SCOPE)
endfunction(add_dependent_subproject)

# Make sure we tell the topdir CMakeLists that we exist (if build from topdir)
get_directory_property(hasParent PARENT_DIRECTORY)

if(hasParent)
  set(PROJECT_${PROJECT_NAME} true PARENT_SCOPE)
endif()

set(${PROJECT_NAME}_SOURCE_DIRS_OWN ${SOURCE_DIR})

# project specific paameters :
function(configure_additional_options)
  configure_file( ./include/${PROJECT_NAME}_options.h.in ${PROJECT_NAME}_options.h @ONLY)
  target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
endfunction(configure_additional_options)