# Exporting core MIV_RV32_CFG2_0 to TCL
# Exporting Create design command for core MIV_RV32_CFG2_0
create_and_configure_core -core_vlnv {Microsemi:MiV:MIV_RV32:3.1.100} -download_core -component_name {MIV_RV32_CFG2_C0} -params {\
"AHB_END_ADDR_0:0xffff"  \
"AHB_END_ADDR_1:0x8fff"  \
"AHB_INITIATOR_TYPE:0"  \
"AHB_START_ADDR_0:0x0"  \
"AHB_START_ADDR_1:0x8000"  \
"AHB_TARGET_MIRROR:false"  \
"APB_END_ADDR_0:0xffff"  \
"APB_END_ADDR_1:0x7fff"  \
"APB_INITIATOR_TYPE:1"  \
"APB_START_ADDR_0:0x0"  \
"APB_START_ADDR_1:0x7000"  \
"APB_TARGET_MIRROR:false"  \
"AXI_END_ADDR_0:0xffff"  \
"AXI_END_ADDR_1:0x8fff"  \
"AXI_INITIATOR_TYPE:2"  \
"AXI_START_ADDR_0:0x0"  \
"AXI_START_ADDR_1:0x8000"  \
"AXI_TARGET_MIRROR:true"  \
"BOOTROM_DEST_ADDR_LOWER:0x0"  \
"BOOTROM_DEST_ADDR_UPPER:0x4000"  \
"BOOTROM_PRESENT:false"  \
"BOOTROM_SRC_END_ADDR_LOWER:0x3fff"  \
"BOOTROM_SRC_END_ADDR_UPPER:0x8000"  \
"BOOTROM_SRC_START_ADDR_LOWER:0x0"  \
"BOOTROM_SRC_START_ADDR_UPPER:0x8000"  \
"C_EXT:false"  \
"DEBUGGER:true"  \
"ECC_ENABLE:false"  \
"F_EXT:false"  \
"FWD_REGS:false"  \
"GEN_MUL_TYPE:0"  \
"GPR_REGS:false"  \
"I_REGS:false"  \
"I_TRACE:false"  \
"ICACHE_EN:false"  \
"INTERNAL_MTIME:true"  \
"INTERNAL_MTIME_IRQ:true"  \
"M_EXT:true"  \
"MI_I_MEM:false"  \
"MIV_HART_ID:0x0"  \
"MTIME_PRESCALER:100"  \
"NO_MACC_BLK:false"  \
"NUM_EXT_IRQS:1"  \
"RECONFIG_BOOTROM:false"  \
"RESET_VECTOR_ADDR_0:0x0"  \
"RESET_VECTOR_ADDR_1:0x8000"  \
"TAS_END_ADDR_0:0x3fff"  \
"TAS_END_ADDR_1:0x4000"  \
"TAS_START_ADDR_0:0x0"  \
"TAS_START_ADDR_1:0x4000"  \
"TCM_END_ADDR_0:0xffff"  \
"TCM_END_ADDR_1:0x4000"  \
"TCM_PRESENT:false"  \
"TCM_REGS:false"  \
"TCM_START_ADDR_0:0x0"  \
"TCM_START_ADDR_1:0x4000"  \
"TCM_TAS_PRESENT:false"  \
"VECTORED_INTERRUPTS:false"   }
# Exporting core MIV_RV32_CFG2_0 to TCL done
