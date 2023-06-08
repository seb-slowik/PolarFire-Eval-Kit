# Exporting Component Description of MIV_RV32_C0 to TCL
# Family: PolarFire
# Part Number: MPF300TS-1FCG1152I
# Create and Configure the core component MIV_RV32_C0
create_and_configure_core -core_vlnv {Microsemi:MiV:MIV_RV32:3.0.100} -download_core -component_name {MIV_RV32_C0} -params {\
"AHB_END_ADDR_0:0xffff"  \
"AHB_END_ADDR_1:0x6fff"  \
"AHB_MASTER_TYPE:1"  \
"AHB_SLAVE_MIRROR:false"  \
"AHB_START_ADDR_0:0x0"  \
"AHB_START_ADDR_1:0x6000"  \
"APB_END_ADDR_0:0xffff"  \
"APB_END_ADDR_1:0x7fff"  \
"APB_MASTER_TYPE:1"  \
"APB_SLAVE_MIRROR:false"  \
"APB_START_ADDR_0:0x0"  \
"APB_START_ADDR_1:0x7000"  \
"AXI_END_ADDR_0:0xffff"  \
"AXI_END_ADDR_1:0x8fff"  \
"AXI_MASTER_TYPE:2"  \
"AXI_SLAVE_MIRROR:false"  \
"AXI_START_ADDR_0:0x0"  \
"AXI_START_ADDR_1:0x8000"  \
"BOOTROM_DEST_ADDR_LOWER:0x0"  \
"BOOTROM_DEST_ADDR_UPPER:0x4000"  \
"BOOTROM_PRESENT:false"  \
"BOOTROM_SRC_END_ADDR_LOWER:0x3fff"  \
"BOOTROM_SRC_END_ADDR_UPPER:0x8000"  \
"BOOTROM_SRC_START_ADDR_LOWER:0x0"  \
"BOOTROM_SRC_START_ADDR_UPPER:0x8000"  \
"DEBUGGER:true"  \
"ECC_ENABLE:false"  \
"FWD_REGS:false"  \
"GEN_DECODE_RV32:3"  \
"GEN_MUL_TYPE:0"  \
"GPR_REGS:false"  \
"INTERNAL_MTIME:true"  \
"INTERNAL_MTIME_IRQ:true"  \
"MTIME_PRESCALER:100"  \
"NUM_EXT_IRQS:0"  \
"RESET_VECTOR_ADDR_0:0x0"  \
"RESET_VECTOR_ADDR_1:0x8000"  \
"TAS_END_ADDR_0:0x3fff"  \
"TAS_END_ADDR_1:0x4000"  \
"TAS_START_ADDR_0:0x0"  \
"TAS_START_ADDR_1:0x4000"  \
"TCM_END_ADDR_0:0x3fff"  \
"TCM_END_ADDR_1:0x4000"  \
"TCM_PRESENT:false"  \
"TCM_START_ADDR_0:0x0"  \
"TCM_START_ADDR_1:0x4000"  \
"TCM_TAS_PRESENT:false"  \
"VECTORED_INTERRUPTS:false"   }
# Exporting Component Description of MIV_RV32_C0 to TCL done
