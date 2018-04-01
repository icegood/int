# Function to link between sub-projects
function(add_dependent_subproject subproject_name)
    #if (NOT TARGET ${subproject_name}) # target unknown
    # var unknown because we build only this subproject, ProjA must have been built AND installed
    if(NOT PROJECT_${subproject_name})
        find_package(${subproject_name} CONFIG REQUIRED)
    endif ()
endfunction(add_dependent_subproject)

# Make sure we tell the topdir CMakeLists that we exist (if build from topdir)
get_directory_property(hasParent PARENT_DIRECTORY)

# message(STATUS, "PROJECT_${PROJECT_NAME}=${PROJECT_${PROJECT_NAME}}")
if(hasParent)
    set(PROJECT_${PROJECT_NAME} true PARENT_SCOPE)
endif()
# message(STATUS, "PROJECT_${PROJECT_NAME}=${PROJECT_${PROJECT_NAME}}")
