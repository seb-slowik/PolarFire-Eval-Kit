# Libero SmartDesign builder script for PolarFire family hardware platforms
# This builder is targetted at the following soft-CPU configurations:
#
#  MIV_RV32IMA_L1_AHB: CFG1 
#  MIV_RV32IMA_L1_AHB: CFG2
#
#Libero's TCL top level script
#
#This Tcl file sources other Tcl files to build the design(on which recursive export is run) in a bottom-up fashion

#Sourcing the Tcl files for each of the design's components

source $scriptDir/import/components/PF_INIT_MONITOR_C0.tcl 
source $scriptDir/import/components/CORERESET_PF_C0.tcl 
source $scriptDir/import/components/PF_CCC_C0.tcl
source $scriptDir/import/components/COREAHBTOAPB3_C0.tcl 
source $scriptDir/import/components/CoreUARTapb_C0.tcl 
source $scriptDir/import/components/CoreAHBL_C0.tcl 
source $scriptDir/import/components/CoreAPB3_C0.tcl 
source $scriptDir/import/components/CoreGPIO_IN_C0.tcl 
source $scriptDir/import/components/CoreGPIO_OUT_C0.tcl 
source $scriptDir/import/components/CoreJTAGDebug_${cjdRstType}_C0.tcl 
source $scriptDir/import/components/CoreTimer_C0.tcl 
source $scriptDir/import/components/CoreTimer_C1.tcl 
if {$config eq "CFG3"} {source $scriptDir/import/components/CoreAXITOAHBL_C0.tcl
						source $scriptDir/import/components/CoreAXITOAHBL_C1.tcl}
source $scriptDir/import/components/${legacyCpu}_C0.tcl
source $scriptDir/import/components/PF_SRAM_AHB_C0.tcl 

# Creating SmartDesign BaseDesign
create_smartdesign -sd_name ${sdName}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sdName} -port_name {SYS_CLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sdName} -port_name {TRSTB} -port_direction {IN}
sd_create_scalar_port -sd_name ${sdName} -port_name {TCK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sdName} -port_name {TDI} -port_direction {IN}
sd_create_scalar_port -sd_name ${sdName} -port_name {TMS} -port_direction {IN}
sd_create_scalar_port -sd_name ${sdName} -port_name {TDO} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sdName} -port_name {RX} -port_direction {IN}
sd_create_scalar_port -sd_name ${sdName} -port_name {TX} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sdName} -port_name {USER_RST} -port_direction {IN}

sd_create_scalar_port -sd_name ${sdName} -port_name {SW_1} -port_direction {IN}
sd_create_scalar_port -sd_name ${sdName} -port_name {SW_2} -port_direction {IN}
sd_create_scalar_port -sd_name ${sdName} -port_name {LED_1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sdName} -port_name {LED_2} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sdName} -port_name {LED_3} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sdName} -port_name {LED_4} -port_direction {OUT}


# MIV_RV32IMAx_L1_xxx (Rocketchip - Legacy) common core instance setup
sd_instantiate_component -sd_name ${sdName} -component_name "${legacyCpu}_C0" -instance_name "${legacyCpu}_C0_0"
sd_create_pin_slices -sd_name ${sdName} -pin_name "${legacyCpu}_C0_0:IRQ" -pin_slices {[28:0]}
sd_connect_pins_to_constant -sd_name ${sdName} -pin_names "$legacyCpu\_C0_0:IRQ\[28:0\]" -value {GND}
sd_create_pin_slices -sd_name ${sdName} -pin_name "${legacyCpu}_C0_0:IRQ" -pin_slices {[29]}
sd_create_pin_slices -sd_name ${sdName} -pin_name "${legacyCpu}_C0_0:IRQ" -pin_slices {[30]}
sd_mark_pins_unused -sd_name ${sdName} -pin_names "${legacyCpu}_C0_0:DRV_TDO"
sd_mark_pins_unused -sd_name ${sdName} -pin_names "${legacyCpu}_C0_0:EXT_RESETN"
if {$config in {"CFG1" "CFG2"}} {sd_mark_pins_unused -sd_name ${sdName} -pin_names "${legacyCpu}_C0_0:AHB_MST_MEM_HSEL"
								 sd_mark_pins_unused -sd_name ${sdName} -pin_names "${legacyCpu}_C0_0:AHB_MST_MMIO_HSEL"}


# Add CORERESET_PF_C0_0 instance
sd_instantiate_component -sd_name ${sdName} -component_name {CORERESET_PF_C0} -instance_name {CORERESET_PF_C0_0}
sd_connect_pins_to_constant -sd_name ${sdName} -pin_names {CORERESET_PF_C0_0:BANK_x_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sdName} -pin_names {CORERESET_PF_C0_0:BANK_y_VDDI_STATUS} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sdName} -pin_names {CORERESET_PF_C0_0:PLL_LOCK} -value {VCC}
sd_connect_pins_to_constant -sd_name ${sdName} -pin_names {CORERESET_PF_C0_0:SS_BUSY} -value {GND}
sd_connect_pins_to_constant -sd_name ${sdName} -pin_names {CORERESET_PF_C0_0:FF_US_RESTORE} -value {GND}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {CORERESET_PF_C0_0:PLL_POWERDOWN_B}


# Add PF_INIT_MONITOR_C0_0 instance
sd_instantiate_component -sd_name ${sdName} -component_name {PF_INIT_MONITOR_C0} -instance_name {PF_INIT_MONITOR_C0_0}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {PF_INIT_MONITOR_C0_0:PCIE_INIT_DONE}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_DONE}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {PF_INIT_MONITOR_C0_0:XCVR_INIT_DONE}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {PF_INIT_MONITOR_C0_0:USRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_FROM_SNVM_DONE}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_FROM_UPROM_DONE}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {PF_INIT_MONITOR_C0_0:SRAM_INIT_FROM_SPI_DONE}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {PF_INIT_MONITOR_C0_0:AUTOCALIB_DONE}


# Add PF_CCC_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_0} -instance_name {PF_CCC_0}


# Add CoreTimer_C0 instance
sd_instantiate_component -sd_name ${sdName} -component_name {CoreTimer_C0} -instance_name {CoreTimer_C0_0}


# Add CoreTimer_C1 instance
sd_instantiate_component -sd_name ${sdName} -component_name {CoreTimer_C1} -instance_name {CoreTimer_C1_0}


# Add CoreJTAGDebug_C0 instance
sd_instantiate_component -sd_name ${sdName} -component_name "CoreJTAGDebug_${cjdRstType}_C0" -instance_name "CoreJTAGDebug_${cjdRstType}_C0_0"


# Add PF_SRAM_AHB_C0_0 instance
sd_instantiate_component -sd_name ${sdName} -component_name {PF_SRAM_AHB_C0} -instance_name {PF_SRAM_AHB_C0_0}


# Add CoreAHBL_C0 instance
sd_instantiate_component -sd_name ${sdName} -component_name {CoreAHBL_C0} -instance_name {CoreAHBL_C0_0}
sd_connect_pins_to_constant -sd_name ${sdName} -pin_names {CoreAHBL_C0_0:REMAP_M0} -value {GND}


# Add COREAHBTOAPB3_C0 instance
sd_instantiate_component -sd_name ${sdName} -component_name {COREAHBTOAPB3_C0} -instance_name {COREAHBTOAPB3_C0_0}


# Add CoreAPB3_C0 instance
sd_instantiate_component -sd_name ${sdName} -component_name {CoreAPB3_C0} -instance_name {CoreAPB3_C0_0}


# Add CoreGPIO_IN_C0 instance
sd_instantiate_component -sd_name ${sdName} -component_name {CoreGPIO_IN_C0} -instance_name {CoreGPIO_IN_C0_0}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {CoreGPIO_IN_C0_0:INT}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {CoreGPIO_IN_C0_0:GPIO_OUT}
sd_create_pin_slices -sd_name ${sdName} -pin_name {CoreGPIO_IN_C0_0:GPIO_IN} -pin_slices {"[0:0]"} 
sd_create_pin_slices -sd_name ${sdName} -pin_name {CoreGPIO_IN_C0_0:GPIO_IN} -pin_slices {"[1:1]"} 


# Add CoreGPIO_OUT_C0 instance
sd_instantiate_component -sd_name ${sdName} -component_name {CoreGPIO_OUT_C0} -instance_name {CoreGPIO_OUT_C0_0}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {CoreGPIO_OUT_C0_0:INT}
sd_connect_pins_to_constant -sd_name ${sdName} -pin_names {CoreGPIO_OUT_C0_0:GPIO_IN} -value {GND}
sd_create_pin_slices -sd_name ${sdName} -pin_name {CoreGPIO_OUT_C0_0:GPIO_OUT} -pin_slices {"[0:0]"} 
sd_create_pin_slices -sd_name ${sdName} -pin_name {CoreGPIO_OUT_C0_0:GPIO_OUT} -pin_slices {"[1:1]"} 
sd_create_pin_slices -sd_name ${sdName} -pin_name {CoreGPIO_OUT_C0_0:GPIO_OUT} -pin_slices {"[2:2]"} 
sd_create_pin_slices -sd_name ${sdName} -pin_name {CoreGPIO_OUT_C0_0:GPIO_OUT} -pin_slices {"[3:3]"} 


# Add CoreUARTapb_C0 instance
sd_instantiate_component -sd_name ${sdName} -component_name {CoreUARTapb_C0} -instance_name {CoreUARTapb_C0_0}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {CoreUARTapb_C0_0:TXRDY}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {CoreUARTapb_C0_0:RXRDY}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {CoreUARTapb_C0_0:PARITY_ERR}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {CoreUARTapb_C0_0:OVERFLOW}
sd_mark_pins_unused -sd_name ${sdName} -pin_names {CoreUARTapb_C0_0:FRAMING_ERR}


# Config specific components

# CFG3: Add CoreAXITOAHBL_C0 instance
if {$config eq "CFG3"} {sd_instantiate_component -sd_name ${sdName} -component_name {CoreAXITOAHBL_C0} -instance_name {CoreAXITOAHBL_C0_0} }

# CFG3: Add CoreAXITOAHBL_C1 instance
if {$config eq "CFG3"} {sd_instantiate_component -sd_name ${sdName} -component_name {CoreAXITOAHBL_C1} -instance_name {CoreAXITOAHBL_C1_0} }


# Add scalar net connections

# Clock connections
sd_connect_pins -sd_name ${sdName} -pin_names {"SYS_CLK" "CORERESET_PF_C0_0:CLK"}
sd_connect_pins -sd_name ${sdName} -pin_names "SYS_CLK ${legacyCpu}_C0_0:CLK" 
sd_connect_pins -sd_name ${sdName} -pin_names "SYS_CLK CoreTimer_C0_0:PCLK"
sd_connect_pins -sd_name ${sdName} -pin_names "SYS_CLK CoreTimer_C1_0:PCLK"
sd_connect_pins -sd_name ${sdName} -pin_names {"SYS_CLK" "PF_SRAM_AHB_C0_0:HCLK"} 
sd_connect_pins -sd_name ${sdName} -pin_names {"SYS_CLK" "CoreAHBL_C0_0:HCLK"}
sd_connect_pins -sd_name ${sdName} -pin_names {"SYS_CLK" "COREAHBTOAPB3_C0_0:HCLK"}
sd_connect_pins -sd_name ${sdName} -pin_names {"SYS_CLK" "CoreUARTapb_C0_0:PCLK"}
sd_connect_pins -sd_name ${sdName} -pin_names {"SYS_CLK" "CoreGPIO_IN_C0_0:PCLK"}
sd_connect_pins -sd_name ${sdName} -pin_names {"SYS_CLK" "CoreGPIO_OUT_C0_0:PCLK"}
sd_connect_pins -sd_name ${sdName} -pin_names {"CORERESET_PF_C0_0:FABRIC_RESET_N" "PF_SRAM_AHB_C0_0:HRESETN"}
if {$config eq "CFG3"} {sd_connect_pins -sd_name ${sdName} -pin_names {"SYS_CLK" "CoreAXITOAHBL_C0_0:HCLK" "CoreAXITOAHBL_C0_0:ACLK"}
						sd_connect_pins -sd_name ${sdName} -pin_names {"SYS_CLK" "CoreAXITOAHBL_C1_0:HCLK" "CoreAXITOAHBL_C1_0:ACLK"}
						sd_connect_pins -sd_name ${sdName} -pin_names {"CORERESET_PF_C0_0:FABRIC_RESET_N" "CoreAXITOAHBL_C0_0:HRESETN" "CoreAXITOAHBL_C0_0:ARESETN"}
						sd_connect_pins -sd_name ${sdName} -pin_names {"CORERESET_PF_C0_0:FABRIC_RESET_N" "CoreAXITOAHBL_C1_0:HRESETN" "CoreAXITOAHBL_C1_0:ARESETN"} }

sd_connect_pins -sd_name ${sdName} -pin_names {"USER_RST" "CORERESET_PF_C0_0:EXT_RST_N"}
sd_connect_pins -sd_name ${sdName} -pin_names "CORERESET_PF_C0_0:FABRIC_RESET_N ${legacyCpu}_C0_0:RESETN"
sd_connect_pins -sd_name ${sdName} -pin_names "CORERESET_PF_C0_0:FABRIC_RESET_N CoreTimer_C0_0:PRESETn"
sd_connect_pins -sd_name ${sdName} -pin_names "CORERESET_PF_C0_0:FABRIC_RESET_N CoreTimer_C1_0:PRESETn"
sd_connect_pins -sd_name ${sdName} -pin_names {"CORERESET_PF_C0_0:FABRIC_RESET_N" "CoreAHBL_C0_0:HRESETN"}
sd_connect_pins -sd_name ${sdName} -pin_names {"CORERESET_PF_C0_0:FABRIC_RESET_N" "COREAHBTOAPB3_C0_0:HRESETN"}
sd_connect_pins -sd_name ${sdName} -pin_names {"CORERESET_PF_C0_0:FABRIC_RESET_N" "CoreUARTapb_C0_0:PRESETN"}
sd_connect_pins -sd_name ${sdName} -pin_names {"CORERESET_PF_C0_0:FABRIC_RESET_N" "CoreGPIO_IN_C0_0:PRESETN"}
sd_connect_pins -sd_name ${sdName} -pin_names {"CORERESET_PF_C0_0:FABRIC_RESET_N" "CoreGPIO_OUT_C0_0:PRESETN"}

sd_connect_pins -sd_name ${sdName} -pin_names "COREJTAGDEBUG_${cjdRstType}_C0_0:TGT_TCK_0 ${legacyCpu}_C0_0:TCK"
sd_connect_pins -sd_name ${sdName} -pin_names "COREJTAGDEBUG_${cjdRstType}_C0_0:TGT_TDI_0 ${legacyCpu}_C0_0:TDI"
sd_connect_pins -sd_name ${sdName} -pin_names "COREJTAGDEBUG_${cjdRstType}_C0_0:TGT_TDO_0 ${legacyCpu}_C0_0:TDO"
sd_connect_pins -sd_name ${sdName} -pin_names "COREJTAGDEBUG_${cjdRstType}_C0_0:TGT_TMS_0 ${legacyCpu}_C0_0:TMS"
sd_connect_pins -sd_name ${sdName} -pin_names "COREJTAGDEBUG_${cjdRstType}_C0_0:TGT_${cjdRstType}_0 ${legacyCpu}_C0_0:${cjdRstType}" 
sd_connect_pins -sd_name ${sdName} -pin_names {"CORERESET_PF_C0_0:FPGA_POR_N" "PF_INIT_MONITOR_C0_0:FABRIC_POR_N" }
sd_connect_pins -sd_name ${sdName} -pin_names {"CORERESET_PF_C0_0:INIT_DONE" "PF_INIT_MONITOR_C0_0:DEVICE_INIT_DONE" }
sd_connect_pins -sd_name ${sdName} -pin_names "${legacyCpu}_C0_0:IRQ\[29\] CoreTimer_C0_0:TIMINT"
sd_connect_pins -sd_name ${sdName} -pin_names "${legacyCpu}_C0_0:IRQ\[30\] CoreTimer_C1_0:TIMINT"
sd_connect_pins -sd_name ${sdName} -pin_names {"CoreUARTapb_C0_0:RX" "RX" }
sd_connect_pins -sd_name ${sdName} -pin_names {"CoreUARTapb_C0_0:TX" "TX" }

sd_connect_pins -sd_name ${sdName} -pin_names "COREJTAGDEBUG_${cjdRstType}_C0_0:TCK TCK"
sd_connect_pins -sd_name ${sdName} -pin_names "COREJTAGDEBUG_${cjdRstType}_C0_0:TDI TDI"
sd_connect_pins -sd_name ${sdName} -pin_names "COREJTAGDEBUG_${cjdRstType}_C0_0:TDO TDO"
sd_connect_pins -sd_name ${sdName} -pin_names "COREJTAGDEBUG_${cjdRstType}_C0_0:TMS TMS"
sd_connect_pins -sd_name ${sdName} -pin_names "COREJTAGDEBUG_${cjdRstType}_C0_0:TRSTB TRSTB"

# Add bus net connections
sd_connect_pins -sd_name ${sdName} -pin_names {"CoreGPIO_IN_C0_0:GPIO_IN[0]" "SW_1" }
sd_connect_pins -sd_name ${sdName} -pin_names {"CoreGPIO_IN_C0_0:GPIO_IN[1]" "SW_2" }
sd_connect_pins -sd_name ${sdName} -pin_names {"CoreGPIO_OUT_C0_0:GPIO_OUT[0]" "LED_1" }
sd_connect_pins -sd_name ${sdName} -pin_names {"CoreGPIO_OUT_C0_0:GPIO_OUT[1]" "LED_2" }
sd_connect_pins -sd_name ${sdName} -pin_names {"CoreGPIO_OUT_C0_0:GPIO_OUT[2]" "LED_3" }
sd_connect_pins -sd_name ${sdName} -pin_names {"CoreGPIO_OUT_C0_0:GPIO_OUT[3]" "LED_4" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sdName} -pin_names {"COREAHBTOAPB3_C0_0:AHBslave" "CoreAHBL_C0_0:AHBmslave7" }
sd_connect_pins -sd_name ${sdName} -pin_names {"PF_SRAM_AHB_C0_0:AHBSlaveInterface" "CoreAHBL_C0_0:AHBmslave8" }
sd_connect_pins -sd_name ${sdName} -pin_names {"CoreAPB3_C0_0:APB3mmaster" "COREAHBTOAPB3_C0_0:APBmaster" }
sd_connect_pins -sd_name ${sdName} -pin_names {"CoreAPB3_C0_0:APBmslave1" "CoreUARTapb_C0_0:APB_bif" }
sd_connect_pins -sd_name ${sdName} -pin_names {"CoreAPB3_C0_0:APBmslave2" "CoreGPIO_IN_C0_0:APB_bif" }
sd_connect_pins -sd_name ${sdName} -pin_names {"CoreAPB3_C0_0:APBmslave3" "CoreTimer_C0_0:APBslave" }
sd_connect_pins -sd_name ${sdName} -pin_names {"CoreAPB3_C0_0:APBmslave4" "CoreTimer_C1_0:APBslave" }
sd_connect_pins -sd_name ${sdName} -pin_names {"CoreAPB3_C0_0:APBmslave5" "CoreGPIO_OUT_C0_0:APB_bif" }
if {$config in {"CFG1" "CFG2"}} {sd_connect_pins -sd_name ${sdName} -pin_names "${legacyCpu}_C0_0:AHB_MST_MMIO CoreAHBL_C0_0:AHBmmaster0"
								 sd_connect_pins -sd_name ${sdName} -pin_names "${legacyCpu}_C0_0:AHB_MST_MEM CoreAHBL_C0_0:AHBmmaster1"}
if {$config eq "CFG3"} {sd_connect_pins -sd_name ${sdName} -pin_names {"CoreAHBL_C0_0:AHBmmaster0" "CoreAXITOAHBL_C0_0:AHBMasterIF" }
						sd_connect_pins -sd_name ${sdName} -pin_names {"CoreAHBL_C0_0:AHBmmaster1" "CoreAXITOAHBL_C1_0:AHBMasterIF" }
						sd_connect_pins -sd_name ${sdName} -pin_names "${legacyCpu}_C0_0:MMIO_MST_AXI CoreAXITOAHBL_C0_0:AXI_MM_IF"
						sd_connect_pins -sd_name ${sdName} -pin_names "${legacyCpu}_C0_0:MEM_MST_AXI CoreAXITOAHBL_C1_0:AXI_MM_IF"}


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Re-arrange SmartDesign layout
sd_reset_layout -sd_name ${sdName}
# Save the smartDesign
save_smartdesign -sd_name ${sdName}
# Generate SmartDesign BaseDesign
generate_component -component_name ${sdName}
