# Build the design hierarchy and set the root of the project
build_design_hierarchy
set_root $sdName

# Not currently supported feature
# If LPR (Low-Powered RAM) memory client selected for TCM, modify .pkg files
#if {($hwFamily eq "POLARFIRE") && ($softCpu eq "MIV_RV32") && ($config eq "CFG3")} then {
#    set tcmRamCfg_fp $projectDir/component/Microsemi/MiV/MIV_RV32/3.1.100/pkg/miv_rv32_subsys_pkg.v
#	puts "Info: Configuring Low-powered RAM for TCM, modifying pkg file: $tcmRamCfg_fp"
#	update_param $tcmRamCfg_fp \
#		"  localparam logic        l_cfg_hard_tcm0_en              " \
#		"= 1'b1;"
#	build_design_hierarchy
#}

# Import constraint files for all base and design guide configurations
if {$config in {"CFG1" "CFG2" "CFG3" "DGC1" "DGC3" "DGC4"}} then {
	import_files -sdc $scriptDir/import/constraints/io_jtag_constraints.sdc

	if {$config in {"CFG1" "CFG2" "CFG3"}} {
		import_files -io_pdc $scriptDir/import/constraints/io/io_constraints.pdc
	} elseif {$config eq "DGC1"} {
		import_files -io_pdc $scriptDir/import/constraints/io_dgc1/io_constraints.pdc
		import_files -io_pdc $scriptDir/import/constraints/io_dgc1/spi_constraints.pdc
	} elseif {$config eq "DGC3"} {
		import_files -io_pdc $scriptDir/import/constraints/io_dgc3/io_constraints.pdc
	} elseif {$config eq "DGC4"} {
		import_files -io_pdc $scriptDir/import/constraints/io_dgc4/io_constraints.pdc
	}
} elseif {$config eq "CFG4"} {
	import_files -io_pdc $scriptDir/import/constraints/cfg4/io_constraints.pdc
	import_files -sdc $scriptDir/import/constraints/cfg4/timing_user_constraints.sdc
	import_files -fp_pdc $scriptDir/import/constraints/cfg4/fp_constraints.pdc
}

# Organize PDC and SDC constraints to Synthesis, Place and Route and Verify Timing tools

# CFG1, CFG2, CFG3 MIV_RV32: Base Configs
# DGC3 MIV_ESS: uPROM-Boot
# DGC4 MIV_ESS: Base Peripherals
if {$config in {"CFG1" "CFG2" "CFG3" "DGC3" "DGC4"}} {
	organize_tool_files -tool {PLACEROUTE} \
		-file $projectDir/constraint/io/io_constraints.pdc \
		-file $projectDir/constraint/io_jtag_constraints.sdc \
		-module ${sdName}::work -input_type {constraint}

	organize_tool_files -tool {SYNTHESIZE} \
		-file $projectDir/constraint/io_jtag_constraints.sdc \
		-module ${sdName}::work -input_type {constraint}

	organize_tool_files -tool {VERIFYTIMING} \
		-file $projectDir/constraint/io_jtag_constraints.sdc \
		-module ${sdName}::work -input_type {constraint}

# DGC1 MIV_ESS: SPI-Boot
} elseif {$config eq "DGC1"} {
	organize_tool_files -tool {PLACEROUTE} \
		-file $projectDir/constraint/io/io_constraints.pdc \
		-file $projectDir/constraint/io/spi_constraints.pdc \
		-file $projectDir/constraint/io_jtag_constraints.sdc \
		-module ${sdName}::work -input_type {constraint}

	organize_tool_files -tool {SYNTHESIZE} \
		-file $projectDir/constraint/io_jtag_constraints.sdc \
		-module ${sdName}::work -input_type {constraint}

	organize_tool_files -tool {VERIFYTIMING} \
		-file $projectDir/constraint/io_jtag_constraints.sdc \
		-module ${sdName}::work -input_type {constraint}

# CFG4: Crypto design with MIV_RV32
} elseif {$config eq "CFG4"} {
	print_message "CFG4 Memory Map"
	puts "| Component             | Address Offset  | Range  | High Address |"
	puts "| Crypto_Buffer_0       | 0x0100_0000     | 16MB   | 0x01FF_FFFF  |"
	puts "| AHBS_TO_AHBM_Bridge   | 0x0200_0000     | 16MB   | 0x02FF_FFFF  |"
	puts "| UART_IF_0             | 0x7000_0000     | 4KB    | 0x0000_0FFF  |"
	puts "| CoreGPIO_OUT_0        | 0x7000_1000     | 4KB    | 0x0000_1FFF  |"
	puts "| SPI_Controller        | 0x7000_2000     | 4KB    | 0x0000_2FFF  |"
	puts "| SystemServices_0      | 0x7000_3000     | 4KB    | 0x0000_3FFF  |"
	puts "| LSRAM_0               | 0x8000_0000     | 64kB   | 0x8000_FFFF  |"
	puts "| DDR3_Subsys_0         | 0x8001_0000     | 15MB   | 0x80FF_FFFF  |"
	# #Associate SDC constraint file to Place and Route tool
	organize_tool_files -tool {PLACEROUTE} \
		-file $projectDir/constraint/io/io_constraints.pdc \
		-file $projectDir/constraint/timing_user_constraints.sdc \
		-file $projectDir/constraint/fp/fp_constraints.pdc \
		-module ${sdName}::work -input_type {constraint}
	organize_tool_files -tool {SYNTHESIZE} \
		-file $projectDir/constraint/timing_user_constraints.sdc \
		-module ${sdName}::work -input_type {constraint}
	organize_tool_files -tool {VERIFYTIMING} \
		-file $projectDir/constraint/timing_user_constraints.sdc \
		-module ${sdName}::work -input_type {constraint}
}

run_tool -name {CONSTRAINT_MANAGEMENT}
derive_constraints_sdc



