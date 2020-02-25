include(${CMAKE_TOOLS_DIR}/Common.cmake)

project(GLApp)

file(GLOB_RECURSE PROJECT_PRIVATE_FILES "${CMAKE_CURRENT_SOURCE_DIR}/Private/*.h" "${CMAKE_CURRENT_SOURCE_DIR}/Private/*.cpp")

add_executable(${PROJECT_NAME} ${PROJECT_PRIVATE_FILES} ${PROJECT_PUBLIC_FILES})

set_target_properties(${PROJECT_NAME} PROPERTIES FOLDER Apps)

target_compile_options(${PROJECT_NAME} PRIVATE ${COMPILE_OPTIONS})

target_link_libraries(${PROJECT_NAME} PRIVATE Core Graphics)

register_fastbuild_target(${PROJECT_NAME})
