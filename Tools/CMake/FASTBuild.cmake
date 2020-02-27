function(register_fastbuild_target tgt)
	append_global(all_targets ${tgt})
	get_global(all_targets tgts)
endfunction()

function(unquote_list out in)
	separate_arguments(tmp NATIVE_COMMAND "${in}")
	set(${out} ${tmp} PARENT_SCOPE)
endfunction()

function(quote_list_elements out in)
	set(tmp)
	foreach(entry ${in})
		list(APPEND tmp "'${entry}'")
	endforeach()
	set(${out} ${tmp} PARENT_SCOPE)
endfunction()

function(setup_fastbuild)
	get_global(all_targets targets)
	message(STATUS "all_targets: ${targets}")

	add_custom_target(FASTBuild)
	set(PROJECT_NAME FASTBuild)
	set_target_properties(${PROJECT_NAME} PROPERTIES FOLDER Build)

	add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND type ARGS nul > fbuild.bff)
	add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS "#include \"../../../fbuild-msvc.bff\"" >> fbuild.bff)

	foreach(tgt ${targets})
		#add_dependencies(${PROJECT_NAME} ${tgt})

		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND type ARGS nul > ${tgt}.bff)
		#add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS ${CMD})
		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS ObjectList('${tgt}') { >> ${tgt}.bff)
		#add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS $<CONFIGURATION> >> ${tgt}.bff)
		#add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS $<TARGET_PROPERTY:${tgt},COMPILE_OPTIONS> >> ${tgt}.bff)
		#add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS ${CMAKE_CXX_FLAGS_${CONFIGURATION_TYPE}} >> ${tgt}.bff)
		#add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS ${CMAKE_EXE_LINKER_FLAGS_${CONFIGURATION_TYPE}} >> ${tgt}.bff)

		get_target_property(target_sources ${tgt} SOURCES)
		foreach(src ${target_sources})
			get_filename_component(extention ${src} EXT)
			if (${extention} STREQUAL ".h")
				LIST(REMOVE_ITEM target_sources ${src})
			endif()
		endforeach()
		quote_list_elements(target_sources "${target_sources}")
		string(REPLACE ";" ", " target_sources "${target_sources}")
		unquote_list(target_sources "{ ${target_sources} }")

		print_target_properties(${tgt})

		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS .CompilerInputFiles = ${target_sources} >> ${tgt}.bff)
		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS .CompilerOutputPath = '${CMAKE_CURRENT_BINARY_DIR}' >> ${tgt}.bff)
		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS .CompilerOptions + ' $<TARGET_PROPERTY:${tgt},COMPILE_DEFINITIONS>' >> ${tgt}.bff)
		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS .CompilerOptions + ' $<TARGET_PROPERTY:${tgt},INCLUDE_DIRECTORIES>' >> ${tgt}.bff)
		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS .CompilerOptions + ' $<TARGET_PROPERTY:${tgt},COMPILE_OPTIONS>' >> ${tgt}.bff)

		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo } >> ${tgt}.bff)


		add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS "#include \"${tgt}.bff\"" >> fbuild.bff)
	endforeach()


	quote_list_elements(targets_array "${targets}")
	string(REPLACE ";" ", " targets_array "${targets_array}")
	unquote_list(targets_array "{ ${targets_array} }")
	add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND @echo ARGS Alias( 'all' ) { .Targets = ${targets_array} } >> fbuild.bff)

	add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD COMMAND fbuild)

	#get_global(executables_prop executables)
	#set_global(executables_prop "${executables};${tgt}")
	#


endfunction()