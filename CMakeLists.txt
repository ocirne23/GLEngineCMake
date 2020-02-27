cmake_minimum_required (VERSION 3.14)

message(STATUS "CMAKE_VERSION: ${CMAKE_VERSION}")
string(TOUPPER ${CMAKE_BUILD_TYPE} CONFIGURATION_TYPE)
message(STATUS "CONFIGURATION_TYPE: ${CONFIGURATION_TYPE}")

#set(CMAKE_GENERATOR "Ninja")
set(CMAKE_PROJECT_NAME "GLEngine")
set(ROOT_DIR "${CMAKE_CURRENT_LIST_DIR}")
set(CMAKE_TOOLS_DIR "${ROOT_DIR}/Tools/CMake")

include(${CMAKE_TOOLS_DIR}/Common.cmake)
include(${CMAKE_TOOLS_DIR}/FASTBuild.cmake)

get_filename_component(OUTPUT_EXT "${CMAKE_BINARY_DIR}" NAME)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${ROOT_DIR}/out/bin/${OUTPUT_EXT}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${ROOT_DIR}/out/lib/${OUTPUT_EXT}")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${ROOT_DIR}/out/lib/${OUTPUT_EXT}")
list(APPEND COMPILE_OPTIONS "/std:c++latest")

project(GLEngine CXX)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_property(GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER "Build")

link_directories("${ROOT_DIR}/out/lib/${OUTPUT_EXT}")

add_subdirectory(Dependencies)
add_subdirectory(Code)
add_subdirectory(Tools)

setup_fastbuild()

message(STATUS "CMAKE_BINARY_DIR: ${CMAKE_BINARY_DIR}")