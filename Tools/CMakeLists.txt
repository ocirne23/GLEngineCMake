
file(GLOB_RECURSE file_list "${CMAKE_CURRENT_SOURCE_DIR}/CMake/*.*")
list(APPEND file_list "${CMAKE_CURRENT_SOURCE_DIR}/../fbuild.bff")
list(APPEND file_list "${CMAKE_CURRENT_SOURCE_DIR}/../CMakeLists.txt")

foreach(file ${file_list})
	set_source_files_properties(${file} PROPERTIES LANGUAGE DUMMY) # In order to get non .cpp/.h files to show up in visual studio
endforeach()
set(CMAKE_DUMMY_COMPILE_OBJECT "cmd /c") # minimal process for dummy file type compilation

add_library(BuildScripts MODULE EXCLUDE_FROM_ALL "${file_list}")
set(PROJECT_NAME BuildScripts)
set_target_properties(${PROJECT_NAME} PROPERTIES FOLDER Build)
group_sources_by_folder(${PROJECT_NAME})