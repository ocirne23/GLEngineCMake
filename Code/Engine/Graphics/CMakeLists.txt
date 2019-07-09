include(${CMAKE_TOOLS_DIR}/Common.cmake)

project(Graphics)

file(GLOB_RECURSE PROJECT_PRIVATE_FILES "${CMAKE_CURRENT_SOURCE_DIR}/Private/*.h" "${CMAKE_CURRENT_SOURCE_DIR}/Private/*.cpp")
file(GLOB_RECURSE PROJECT_PUBLIC_FILES  "${CMAKE_CURRENT_SOURCE_DIR}/Public/*.h")

add_library(${PROJECT_NAME} STATIC ${PROJECT_PRIVATE_FILES} ${PROJECT_PUBLIC_FILES})

set_target_properties(${PROJECT_NAME} PROPERTIES FOLDER Engine)

target_include_directories(${PROJECT_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/Private")
target_include_directories(${PROJECT_NAME} PUBLIC  "${CMAKE_CURRENT_SOURCE_DIR}/Public")
target_compile_options    (${PROJECT_NAME} PRIVATE ${COMPILE_OPTIONS})

target_link_libraries(${PROJECT_NAME} PUBLIC Core)

