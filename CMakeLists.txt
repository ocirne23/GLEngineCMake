cmake_minimum_required (VERSION 3.14)

message(STATUS "CMAKE VERSION: ${CMAKE_VERSION}")

set(CMAKE_GENERATOR "Ninja")
set(CMAKE_PROJECT_NAME "GLEngine")
set(ROOT_DIR "${CMAKE_CURRENT_LIST_DIR}")
set(CMAKE_TOOLS_DIR "${ROOT_DIR}/Tools/CMake")
include(${CMAKE_TOOLS_DIR}/Common.cmake)

get_filename_component(OUTPUT_EXT "${CMAKE_BINARY_DIR}" NAME)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${ROOT_DIR}/out/bin/${OUTPUT_EXT}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${ROOT_DIR}/out/lib/${OUTPUT_EXT}")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${ROOT_DIR}/out/lib/${OUTPUT_EXT}")
list(APPEND COMPILE_OPTIONS "/std:c++latest")

project(GLEngine CXX)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

link_directories("${ROOT_DIR}/out/lib/${OUTPUT_EXT}")

add_subdirectory(Code)
