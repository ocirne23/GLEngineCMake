function(register_fastbuild_target tgt)
	append_global(all_targets ${tgt})
	get_global(all_targets tgts)
endfunction()

function(setup_fastbuild)
	get_global(all_targets targets)
	message(STATUS "all_targets: ${targets}")

	add_custom_target(FASTBuild)
	set(PROJECT_NAME FASTBuild)
	set_target_properties(${PROJECT_NAME} PROPERTIES FOLDER Build)

	foreach(tgt ${targets})
		message(STATUS "tgt: ${tgt}")
		add_dependencies(${PROJECT_NAME} ${tgt})

		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND type ARGS nul > ${tgt}.bff)
		#add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS ${CMD})
		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS $<TARGET_PROPERTY:${tgt},COMPILE_OPTIONS> >> ${tgt}.bff)
		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS $<CONFIGURATION> >> ${tgt}.bff)
		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS $<TARGET_PROPERTY:${tgt},COMPILE_FLAGS> >> ${tgt}.bff)
		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS ${CMAKE_CXX_FLAGS_DEBUG} >> ${tgt}.bff)
		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS ${CMAKE_EXE_LINKER_FLAGS_DEBUG} >> ${tgt}.bff)
		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS $<TARGET_PROPERTY:${tgt},SOURCES> >> ${tgt}.bff)
	endforeach()

	#get_global(executables_prop executables)
	#set_global(executables_prop "${executables};${tgt}")



endfunction()