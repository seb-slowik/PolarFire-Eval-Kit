// ********************************************************************/
// Actel Corporation Proprietary and Confidential
// Copyright 2010 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:	CoreAHBLite - multi-master (up to 2) AHBLite
//				bus interface that supports up to 16 slaves and
//				up to 16 Init/Config interfaces,
//				instantiates the following modules:
//				COREAHBLITE_MATRIX2X16
//
//
// SVN Revision Information:
// SVN $Revision: 33877 $
// SVN $Date: 2019-06-24 17:11:39 +0530 (Mon, 24 Jun 2019) $
//
//
// *************************************************************************/
`timescale 1ns/1ps
module CoreAHBL_C0_CoreAHBL_C0_0_CoreAHBLite #(
parameter [5:0]FAMILY		= 17,
parameter [2:0]MEMSPACE		= 0,
parameter [0:0]HADDR_SHG_CFG = 1,
parameter [0:0]SC_0  = 0,
parameter [0:0]SC_1  = 0,
parameter [0:0]SC_2  = 0,
parameter [0:0]SC_3  = 0,
parameter [0:0]SC_4  = 0,
parameter [0:0]SC_5  = 0,
parameter [0:0]SC_6  = 0,
parameter [0:0]SC_7  = 0,
parameter [0:0]SC_8  = 0,
parameter [0:0]SC_9  = 0,
parameter [0:0]SC_10 = 0,
parameter [0:0]SC_11 = 0,
parameter [0:0]SC_12 = 0,
parameter [0:0]SC_13 = 0,
parameter [0:0]SC_14 = 0,
parameter [0:0]SC_15 = 0,
parameter [0:0]M0_AHBSLOT0ENABLE	= 0,
parameter [0:0]M0_AHBSLOT1ENABLE	= 0,
parameter [0:0]M0_AHBSLOT2ENABLE	= 0,
parameter [0:0]M0_AHBSLOT3ENABLE	= 0,
parameter [0:0]M0_AHBSLOT4ENABLE	= 0,
parameter [0:0]M0_AHBSLOT5ENABLE	= 0,
parameter [0:0]M0_AHBSLOT6ENABLE	= 0,
parameter [0:0]M0_AHBSLOT7ENABLE	= 0,
parameter [0:0]M0_AHBSLOT8ENABLE	= 0,
parameter [0:0]M0_AHBSLOT9ENABLE	= 0,
parameter [0:0]M0_AHBSLOT10ENABLE	= 0,
parameter [0:0]M0_AHBSLOT11ENABLE	= 0,
parameter [0:0]M0_AHBSLOT12ENABLE	= 0,
parameter [0:0]M0_AHBSLOT13ENABLE	= 0,
parameter [0:0]M0_AHBSLOT14ENABLE	= 0,
parameter [0:0]M0_AHBSLOT15ENABLE	= 0,
parameter [0:0]M0_AHBSLOT16ENABLE	= 0,
parameter [0:0]M1_AHBSLOT0ENABLE	= 0,
parameter [0:0]M1_AHBSLOT1ENABLE	= 0,
parameter [0:0]M1_AHBSLOT2ENABLE	= 0,
parameter [0:0]M1_AHBSLOT3ENABLE	= 0,
parameter [0:0]M1_AHBSLOT4ENABLE	= 0,
parameter [0:0]M1_AHBSLOT5ENABLE	= 0,
parameter [0:0]M1_AHBSLOT6ENABLE	= 0,
parameter [0:0]M1_AHBSLOT7ENABLE	= 0,
parameter [0:0]M1_AHBSLOT8ENABLE	= 0,
parameter [0:0]M1_AHBSLOT9ENABLE	= 0,
parameter [0:0]M1_AHBSLOT10ENABLE	= 0,
parameter [0:0]M1_AHBSLOT11ENABLE	= 0,
parameter [0:0]M1_AHBSLOT12ENABLE	= 0,
parameter [0:0]M1_AHBSLOT13ENABLE	= 0,
parameter [0:0]M1_AHBSLOT14ENABLE	= 0,
parameter [0:0]M1_AHBSLOT15ENABLE	= 0,
parameter [0:0]M1_AHBSLOT16ENABLE	= 0,
parameter [0:0]M2_AHBSLOT0ENABLE	= 0,
parameter [0:0]M2_AHBSLOT1ENABLE	= 0,
parameter [0:0]M2_AHBSLOT2ENABLE	= 0,
parameter [0:0]M2_AHBSLOT3ENABLE	= 0,
parameter [0:0]M2_AHBSLOT4ENABLE	= 0,
parameter [0:0]M2_AHBSLOT5ENABLE	= 0,
parameter [0:0]M2_AHBSLOT6ENABLE	= 0,
parameter [0:0]M2_AHBSLOT7ENABLE	= 0,
parameter [0:0]M2_AHBSLOT8ENABLE	= 0,
parameter [0:0]M2_AHBSLOT9ENABLE	= 0,
parameter [0:0]M2_AHBSLOT10ENABLE	= 0,
parameter [0:0]M2_AHBSLOT11ENABLE	= 0,
parameter [0:0]M2_AHBSLOT12ENABLE	= 0,
parameter [0:0]M2_AHBSLOT13ENABLE	= 0,
parameter [0:0]M2_AHBSLOT14ENABLE	= 0,
parameter [0:0]M2_AHBSLOT15ENABLE	= 0,
parameter [0:0]M2_AHBSLOT16ENABLE	= 0,
parameter [0:0]M3_AHBSLOT0ENABLE	= 0,
parameter [0:0]M3_AHBSLOT1ENABLE	= 0,
parameter [0:0]M3_AHBSLOT2ENABLE	= 0,
parameter [0:0]M3_AHBSLOT3ENABLE	= 0,
parameter [0:0]M3_AHBSLOT4ENABLE	= 0,
parameter [0:0]M3_AHBSLOT5ENABLE	= 0,
parameter [0:0]M3_AHBSLOT6ENABLE	= 0,
parameter [0:0]M3_AHBSLOT7ENABLE	= 0,
parameter [0:0]M3_AHBSLOT8ENABLE	= 0,
parameter [0:0]M3_AHBSLOT9ENABLE	= 0,
parameter [0:0]M3_AHBSLOT10ENABLE	= 0,
parameter [0:0]M3_AHBSLOT11ENABLE	= 0,
parameter [0:0]M3_AHBSLOT12ENABLE	= 0,
parameter [0:0]M3_AHBSLOT13ENABLE	= 0,
parameter [0:0]M3_AHBSLOT14ENABLE	= 0,
parameter [0:0]M3_AHBSLOT15ENABLE	= 0,
parameter [0:0]M3_AHBSLOT16ENABLE	= 0,
parameter [0:0]MASTER0_INTERFACE	= 1,
parameter [0:0]MASTER1_INTERFACE	= 1,
parameter [0:0]MASTER2_INTERFACE	= 1,
parameter [0:0]MASTER3_INTERFACE	= 1,
parameter [0:0]SLAVE0_INTERFACE   	= 1,
parameter [0:0]SLAVE1_INTERFACE   	= 1,
parameter [0:0]SLAVE2_INTERFACE   	= 1,
parameter [0:0]SLAVE3_INTERFACE   	= 1,
parameter [0:0]SLAVE4_INTERFACE   	= 1,
parameter [0:0]SLAVE5_INTERFACE   	= 1,
parameter [0:0]SLAVE6_INTERFACE   	= 1,
parameter [0:0]SLAVE7_INTERFACE   	= 1,
parameter [0:0]SLAVE8_INTERFACE   	= 1,
parameter [0:0]SLAVE9_INTERFACE   	= 1,
parameter [0:0]SLAVE10_INTERFACE   	= 1,
parameter [0:0]SLAVE11_INTERFACE   	= 1,
parameter [0:0]SLAVE12_INTERFACE   	= 1,
parameter [0:0]SLAVE13_INTERFACE   	= 1,
parameter [0:0]SLAVE14_INTERFACE   	= 1,
parameter [0:0]SLAVE15_INTERFACE   	= 1,
parameter [0:0]SLAVE16_INTERFACE   	= 1,
parameter SYNC_RESET = (FAMILY == 25) ? 1 : 0
)
(
input						HCLK,
input						HRESETN,
input						REMAP_M0,
input			[31:0]		HADDR_M0,
input						HMASTLOCK_M0,
input			[2:0]		HSIZE_M0,
input			[1:0]		HTRANS_M0,
input						HWRITE_M0,
input			[31:0]		HWDATA_M0,
input			[2:0]		HBURST_M0,
input			[3:0]		HPROT_M0,
output	wire	[1:0]		HRESP_M0,
output	wire	[31:0]		HRDATA_M0,
output	wire				HREADY_M0,
input			[31:0]		HADDR_M1,
input						HMASTLOCK_M1,
input			[2:0]		HSIZE_M1,
input			[1:0]		HTRANS_M1,
input						HWRITE_M1,
input			[31:0]		HWDATA_M1,
input			[2:0]		HBURST_M1,
input			[3:0]		HPROT_M1,
output	wire	[1:0]		HRESP_M1,
output	wire	[31:0]		HRDATA_M1,
output	wire				HREADY_M1,
input			[31:0]		HADDR_M2,
input						HMASTLOCK_M2,
input			[2:0]		HSIZE_M2,
input			[1:0]		HTRANS_M2,
input						HWRITE_M2,
input			[31:0]		HWDATA_M2,
input			[2:0]		HBURST_M2,
input			[3:0]		HPROT_M2,
output	wire	[1:0]		HRESP_M2,
output	wire	[31:0]		HRDATA_M2,
output	wire				HREADY_M2,
input			[31:0]		HADDR_M3,
input						HMASTLOCK_M3,
input			[2:0]		HSIZE_M3,
input			[1:0]		HTRANS_M3,
input						HWRITE_M3,
input			[31:0]		HWDATA_M3,
input			[2:0]		HBURST_M3,
input			[3:0]		HPROT_M3,
output	wire	[1:0]		HRESP_M3,
output	wire	[31:0]		HRDATA_M3,
output	wire				HREADY_M3,
input			[31:0]		HRDATA_S0,
input						HREADYOUT_S0,
input			[1:0]		HRESP_S0,
output	wire				HSEL_S0,
output	wire	[31:0]		HADDR_S0,
output	wire	[2:0]		HSIZE_S0,
output	wire	[1:0]		HTRANS_S0,
output	wire				HWRITE_S0,
output	wire	[31:0]		HWDATA_S0,
output	wire				HREADY_S0,
output	wire				HMASTLOCK_S0,
output	wire	[2:0]		HBURST_S0,
output	wire	[3:0]		HPROT_S0,
input			[31:0]		HRDATA_S1,
input						HREADYOUT_S1,
input			[1:0]		HRESP_S1,
output	wire				HSEL_S1,
output	wire	[31:0]		HADDR_S1,
output	wire	[2:0]		HSIZE_S1,
output	wire	[1:0]		HTRANS_S1,
output	wire				HWRITE_S1,
output	wire	[31:0]		HWDATA_S1,
output	wire				HREADY_S1,
output	wire				HMASTLOCK_S1,
output	wire	[2:0]		HBURST_S1,
output	wire	[3:0]		HPROT_S1,
input			[31:0]		HRDATA_S2,
input						HREADYOUT_S2,
input			[1:0]		HRESP_S2,
output	wire				HSEL_S2,
output	wire	[31:0]		HADDR_S2,
output	wire	[2:0]		HSIZE_S2,
output	wire	[1:0]		HTRANS_S2,
output	wire				HWRITE_S2,
output	wire	[31:0]		HWDATA_S2,
output	wire				HREADY_S2,
output	wire				HMASTLOCK_S2,
output	wire	[2:0]		HBURST_S2,
output	wire	[3:0]		HPROT_S2,
input			[31:0]		HRDATA_S3,
input						HREADYOUT_S3,
input			[1:0]		HRESP_S3,
output	wire				HSEL_S3,
output	wire	[31:0]		HADDR_S3,
output	wire	[2:0]		HSIZE_S3,
output	wire	[1:0]		HTRANS_S3,
output	wire				HWRITE_S3,
output	wire	[31:0]		HWDATA_S3,
output	wire				HREADY_S3,
output	wire				HMASTLOCK_S3,
output	wire	[2:0]		HBURST_S3,
output	wire	[3:0]		HPROT_S3,
input			[31:0]		HRDATA_S4,
input						HREADYOUT_S4,
input			[1:0]		HRESP_S4,
output	wire				HSEL_S4,
output	wire	[31:0]		HADDR_S4,
output	wire	[2:0]		HSIZE_S4,
output	wire	[1:0]		HTRANS_S4,
output	wire				HWRITE_S4,
output	wire	[31:0]		HWDATA_S4,
output	wire				HREADY_S4,
output	wire				HMASTLOCK_S4,
output	wire	[2:0]		HBURST_S4,
output	wire	[3:0]		HPROT_S4,
input			[31:0]		HRDATA_S5,
input						HREADYOUT_S5,
input			[1:0]		HRESP_S5,
output	wire				HSEL_S5,
output	wire	[31:0]		HADDR_S5,
output	wire	[2:0]		HSIZE_S5,
output	wire	[1:0]		HTRANS_S5,
output	wire				HWRITE_S5,
output	wire	[31:0]		HWDATA_S5,
output	wire				HREADY_S5,
output	wire				HMASTLOCK_S5,
output	wire	[2:0]		HBURST_S5,
output	wire	[3:0]		HPROT_S5,
input			[31:0]		HRDATA_S6,
input						HREADYOUT_S6,
input			[1:0]		HRESP_S6,
output	wire				HSEL_S6,
output	wire	[31:0]		HADDR_S6,
output	wire	[2:0]		HSIZE_S6,
output	wire	[1:0]		HTRANS_S6,
output	wire				HWRITE_S6,
output	wire	[31:0]		HWDATA_S6,
output	wire				HREADY_S6,
output	wire				HMASTLOCK_S6,
output	wire	[2:0]		HBURST_S6,
output	wire	[3:0]		HPROT_S6,
input			[31:0]		HRDATA_S7,
input						HREADYOUT_S7,
input			[1:0]		HRESP_S7,
output	wire				HSEL_S7,
output	wire	[31:0]		HADDR_S7,
output	wire	[2:0]		HSIZE_S7,
output	wire	[1:0]		HTRANS_S7,
output	wire				HWRITE_S7,
output	wire	[31:0]		HWDATA_S7,
output	wire				HREADY_S7,
output	wire				HMASTLOCK_S7,
output	wire	[2:0]		HBURST_S7,
output	wire	[3:0]		HPROT_S7,
input			[31:0]		HRDATA_S8,
input						HREADYOUT_S8,
input			[1:0]		HRESP_S8,
output	wire				HSEL_S8,
output	wire	[31:0]		HADDR_S8,
output	wire	[2:0]		HSIZE_S8,
output	wire	[1:0]		HTRANS_S8,
output	wire				HWRITE_S8,
output	wire	[31:0]		HWDATA_S8,
output	wire				HREADY_S8,
output	wire				HMASTLOCK_S8,
output	wire	[2:0]		HBURST_S8,
output	wire	[3:0]		HPROT_S8,
input			[31:0]		HRDATA_S9,
input						HREADYOUT_S9,
input			[1:0]		HRESP_S9,
output	wire				HSEL_S9,
output	wire	[31:0]		HADDR_S9,
output	wire	[2:0]		HSIZE_S9,
output	wire	[1:0]		HTRANS_S9,
output	wire				HWRITE_S9,
output	wire	[31:0]		HWDATA_S9,
output	wire				HREADY_S9,
output	wire				HMASTLOCK_S9,
output	wire	[2:0]		HBURST_S9,
output	wire	[3:0]		HPROT_S9,
input			[31:0]		HRDATA_S10,
input						HREADYOUT_S10,
input			[1:0]		HRESP_S10,
output	wire				HSEL_S10,
output	wire	[31:0]		HADDR_S10,
output	wire	[2:0]		HSIZE_S10,
output	wire	[1:0]		HTRANS_S10,
output	wire				HWRITE_S10,
output	wire	[31:0]		HWDATA_S10,
output	wire				HREADY_S10,
output	wire				HMASTLOCK_S10,
output	wire	[2:0]		HBURST_S10,
output	wire	[3:0]		HPROT_S10,
input			[31:0]		HRDATA_S11,
input						HREADYOUT_S11,
input			[1:0]		HRESP_S11,
output	wire				HSEL_S11,
output	wire	[31:0]		HADDR_S11,
output	wire	[2:0]		HSIZE_S11,
output	wire	[1:0]		HTRANS_S11,
output	wire				HWRITE_S11,
output	wire	[31:0]		HWDATA_S11,
output	wire				HREADY_S11,
output	wire				HMASTLOCK_S11,
output	wire	[2:0]		HBURST_S11,
output	wire	[3:0]		HPROT_S11,
input			[31:0]		HRDATA_S12,
input						HREADYOUT_S12,
input			[1:0]		HRESP_S12,
output	wire				HSEL_S12,
output	wire	[31:0]		HADDR_S12,
output	wire	[2:0]		HSIZE_S12,
output	wire	[1:0]		HTRANS_S12,
output	wire				HWRITE_S12,
output	wire	[31:0]		HWDATA_S12,
output	wire				HREADY_S12,
output	wire				HMASTLOCK_S12,
output	wire	[2:0]		HBURST_S12,
output	wire	[3:0]		HPROT_S12,
input			[31:0]		HRDATA_S13,
input						HREADYOUT_S13,
input			[1:0]		HRESP_S13,
output	wire				HSEL_S13,
output	wire	[31:0]		HADDR_S13,
output	wire	[2:0]		HSIZE_S13,
output	wire	[1:0]		HTRANS_S13,
output	wire				HWRITE_S13,
output	wire	[31:0]		HWDATA_S13,
output	wire				HREADY_S13,
output	wire				HMASTLOCK_S13,
output	wire	[2:0]		HBURST_S13,
output	wire	[3:0]		HPROT_S13,
input			[31:0]		HRDATA_S14,
input						HREADYOUT_S14,
input			[1:0]		HRESP_S14,
output	wire				HSEL_S14,
output	wire	[31:0]		HADDR_S14,
output	wire	[2:0]		HSIZE_S14,
output	wire	[1:0]		HTRANS_S14,
output	wire				HWRITE_S14,
output	wire	[31:0]		HWDATA_S14,
output	wire				HREADY_S14,
output	wire				HMASTLOCK_S14,
output	wire	[2:0]		HBURST_S14,
output	wire	[3:0]		HPROT_S14,
input			[31:0]		HRDATA_S15,
input						HREADYOUT_S15,
input			[1:0]		HRESP_S15,
output	wire				HSEL_S15,
output	wire	[31:0]		HADDR_S15,
output	wire	[2:0]		HSIZE_S15,
output	wire	[1:0]		HTRANS_S15,
output	wire				HWRITE_S15,
output	wire	[31:0]		HWDATA_S15,
output	wire				HREADY_S15,
output	wire				HMASTLOCK_S15,
output	wire	[2:0]		HBURST_S15,
output	wire	[3:0]		HPROT_S15,
input			[31:0]		HRDATA_S16,
input						HREADYOUT_S16,
input			[1:0]		HRESP_S16,
output	wire				HSEL_S16,
output	wire	[31:0]		HADDR_S16,
output	wire	[2:0]		HSIZE_S16,
output	wire	[1:0]		HTRANS_S16,
output	wire				HWRITE_S16,
output	wire	[31:0]		HWDATA_S16,
output	wire				HREADY_S16,
output	wire				HMASTLOCK_S16,
output	wire	[2:0]		HBURST_S16,
output	wire	[3:0]		HPROT_S16
);
localparam [16:0]M0_AHBSLOTENABLE	= {
	M0_AHBSLOT16ENABLE,
	M0_AHBSLOT15ENABLE,
	M0_AHBSLOT14ENABLE,
	M0_AHBSLOT13ENABLE,
	M0_AHBSLOT12ENABLE,
	M0_AHBSLOT11ENABLE,
	M0_AHBSLOT10ENABLE,
	M0_AHBSLOT9ENABLE,
	M0_AHBSLOT8ENABLE,
	M0_AHBSLOT7ENABLE,
	M0_AHBSLOT6ENABLE,
	M0_AHBSLOT5ENABLE,
	M0_AHBSLOT4ENABLE,
	M0_AHBSLOT3ENABLE,
	M0_AHBSLOT2ENABLE,
	M0_AHBSLOT1ENABLE,
	M0_AHBSLOT0ENABLE
};
localparam [16:0]M1_AHBSLOTENABLE	= {
	M1_AHBSLOT16ENABLE,
	M1_AHBSLOT15ENABLE,
	M1_AHBSLOT14ENABLE,
	M1_AHBSLOT13ENABLE,
	M1_AHBSLOT12ENABLE,
	M1_AHBSLOT11ENABLE,
	M1_AHBSLOT10ENABLE,
	M1_AHBSLOT9ENABLE,
	M1_AHBSLOT8ENABLE,
	M1_AHBSLOT7ENABLE,
	M1_AHBSLOT6ENABLE,
	M1_AHBSLOT5ENABLE,
	M1_AHBSLOT4ENABLE,
	M1_AHBSLOT3ENABLE,
	M1_AHBSLOT2ENABLE,
	M1_AHBSLOT1ENABLE,
	M1_AHBSLOT0ENABLE
};
localparam [16:0]M2_AHBSLOTENABLE	= {
	M2_AHBSLOT16ENABLE,
	M2_AHBSLOT15ENABLE,
	M2_AHBSLOT14ENABLE,
	M2_AHBSLOT13ENABLE,
	M2_AHBSLOT12ENABLE,
	M2_AHBSLOT11ENABLE,
	M2_AHBSLOT10ENABLE,
	M2_AHBSLOT9ENABLE,
	M2_AHBSLOT8ENABLE,
	M2_AHBSLOT7ENABLE,
	M2_AHBSLOT6ENABLE,
	M2_AHBSLOT5ENABLE,
	M2_AHBSLOT4ENABLE,
	M2_AHBSLOT3ENABLE,
	M2_AHBSLOT2ENABLE,
	M2_AHBSLOT1ENABLE,
	M2_AHBSLOT0ENABLE
};
localparam [16:0]M3_AHBSLOTENABLE	= {
	M3_AHBSLOT16ENABLE,
	M3_AHBSLOT15ENABLE,
	M3_AHBSLOT14ENABLE,
	M3_AHBSLOT13ENABLE,
	M3_AHBSLOT12ENABLE,
	M3_AHBSLOT11ENABLE,
	M3_AHBSLOT10ENABLE,
	M3_AHBSLOT9ENABLE,
	M3_AHBSLOT8ENABLE,
	M3_AHBSLOT7ENABLE,
	M3_AHBSLOT6ENABLE,
	M3_AHBSLOT5ENABLE,
	M3_AHBSLOT4ENABLE,
	M3_AHBSLOT3ENABLE,
	M3_AHBSLOT2ENABLE,
	M3_AHBSLOT1ENABLE,
	M3_AHBSLOT0ENABLE
};
localparam [15:0]SC = {
    SC_15,
    SC_14,
    SC_13,
    SC_12,
    SC_11,
    SC_10,
    SC_9,
    SC_8,
    SC_7,
    SC_6,
    SC_5,
    SC_4,
    SC_3,
    SC_2,
    SC_1,
    SC_0
};
/*assign  HTRANS_S0[0]	= 1'b0;
assign  HTRANS_S1[0]	= 1'b0;
assign  HTRANS_S2[0]	= 1'b0;
assign  HTRANS_S3[0]	= 1'b0;
assign  HTRANS_S4[0]	= 1'b0;
assign  HTRANS_S5[0]	= 1'b0;
assign  HTRANS_S6[0]	= 1'b0;
assign  HTRANS_S7[0]	= 1'b0;
assign  HTRANS_S8[0]	= 1'b0;
assign  HTRANS_S9[0]	= 1'b0;
assign  HTRANS_S10[0]	= 1'b0;
assign  HTRANS_S11[0]	= 1'b0;
assign  HTRANS_S12[0]	= 1'b0;
assign  HTRANS_S13[0]	= 1'b0;
assign  HTRANS_S14[0]	= 1'b0;
assign  HTRANS_S15[0]	= 1'b0;
assign  HTRANS_S16[0]	= 1'b0;*/  // AI : for burst support

assign  HRESP_M0[1]		= 1'b0;
assign  HRESP_M1[1]		= 1'b0;
assign  HRESP_M2[1]		= 1'b0;
assign  HRESP_M3[1]		= 1'b0;

/*                                // AI : for burst support
assign HBURST_S0		= 3'b0;
assign HBURST_S1		= 3'b0;
assign HBURST_S2		= 3'b0;
assign HBURST_S3		= 3'b0;
assign HBURST_S4		= 3'b0;
assign HBURST_S5		= 3'b0;
assign HBURST_S6		= 3'b0;
assign HBURST_S7		= 3'b0;
assign HBURST_S8		= 3'b0;
assign HBURST_S9		= 3'b0;
assign HBURST_S10		= 3'b0;
assign HBURST_S11		= 3'b0;
assign HBURST_S12		= 3'b0;
assign HBURST_S13		= 3'b0;
assign HBURST_S14		= 3'b0;
assign HBURST_S15		= 3'b0;
assign HBURST_S16  		= 3'b0; */


assign HPROT_S0			= 4'b0;
assign HPROT_S1			= 4'b0;
assign HPROT_S2			= 4'b0;
assign HPROT_S3			= 4'b0;
assign HPROT_S4			= 4'b0;
assign HPROT_S5			= 4'b0;
assign HPROT_S6			= 4'b0;
assign HPROT_S7			= 4'b0;
assign HPROT_S8			= 4'b0;
assign HPROT_S9			= 4'b0;
assign HPROT_S10		= 4'b0;
assign HPROT_S11		= 4'b0;
assign HPROT_S12		= 4'b0;
assign HPROT_S13		= 4'b0;
assign HPROT_S14		= 4'b0;
assign HPROT_S15		= 4'b0;
assign HPROT_S16  		= 4'b0;

COREAHBLITE_MATRIX4X16 #(
	.MEMSPACE(MEMSPACE),
    .HADDR_SHG_CFG(HADDR_SHG_CFG),
    .SC(SC),
	.M0_AHBSLOTENABLE(M0_AHBSLOTENABLE),
	.M1_AHBSLOTENABLE(M1_AHBSLOTENABLE),
	.M2_AHBSLOTENABLE(M2_AHBSLOTENABLE),
	.M3_AHBSLOTENABLE(M3_AHBSLOTENABLE),
	.SYNC_RESET(SYNC_RESET)
) matrix4x16 (
	.HCLK(HCLK),
	.HRESETN(HRESETN),
	.REMAP_M0(REMAP_M0),
	.HADDR_M0(HADDR_M0),
	.HMASTLOCK_M0(HMASTLOCK_M0),
	.HSIZE_M0(HSIZE_M0),
	.HTRANS_M0(HTRANS_M0), // AI : mapped two bit htrans
	.HBURST_M0(HBURST_M0), // AI : HBURST support
	.HWRITE_M0(HWRITE_M0),
	.HWDATA_M0(HWDATA_M0),
	.HRESP_M0(HRESP_M0[0]),
	.HRDATA_M0(HRDATA_M0),
	.HREADY_M0(HREADY_M0),
	.HADDR_M1(HADDR_M1),
	.HMASTLOCK_M1(HMASTLOCK_M1),
	.HSIZE_M1(HSIZE_M1),
	.HTRANS_M1(HTRANS_M1), // AI : mapped two bit htrans
	.HBURST_M1(HBURST_M1), // AI : HBURST support
	.HWRITE_M1(HWRITE_M1),
	.HWDATA_M1(HWDATA_M1),
	.HRESP_M1(HRESP_M1[0]),
	.HRDATA_M1(HRDATA_M1),
	.HREADY_M1(HREADY_M1),
	.HADDR_M2(HADDR_M2),
	.HMASTLOCK_M2(HMASTLOCK_M2),
	.HSIZE_M2(HSIZE_M2),
	.HTRANS_M2(HTRANS_M2), // AI : mapped two bit htrans
	.HBURST_M2(HBURST_M2), // AI : HBURST support
	.HWRITE_M2(HWRITE_M2),
	.HWDATA_M2(HWDATA_M2),
	.HRESP_M2(HRESP_M2[0]),
	.HRDATA_M2(HRDATA_M2),
	.HREADY_M2(HREADY_M2),
	.HADDR_M3(HADDR_M3),
	.HMASTLOCK_M3(HMASTLOCK_M3),
	.HSIZE_M3(HSIZE_M3),
	.HTRANS_M3(HTRANS_M3), // AI : mapped two bit htrans
	.HBURST_M3(HBURST_M3), // AI : HBURST support
	.HWRITE_M3(HWRITE_M3),
	.HWDATA_M3(HWDATA_M3),
	.HRESP_M3(HRESP_M3[0]),
	.HRDATA_M3(HRDATA_M3),
	.HREADY_M3(HREADY_M3),
	.HRDATA_S0(HRDATA_S0),
	.HREADYOUT_S0(HREADYOUT_S0),
	.HRESP_S0(HRESP_S0[0]),
	.HSEL_S0(HSEL_S0),
	.HADDR_S0(HADDR_S0),
	.HSIZE_S0(HSIZE_S0),
	.HTRANS_S0(HTRANS_S0), // AI : mapped two bit htrans
	.HBURST_S0(HBURST_S0), // Hburst support 
	.HWRITE_S0(HWRITE_S0),
	.HWDATA_S0(HWDATA_S0),
	.HREADY_S0(HREADY_S0),
	.HMASTLOCK_S0(HMASTLOCK_S0),
	.HRDATA_S1(HRDATA_S1),
	.HREADYOUT_S1(HREADYOUT_S1),
	.HRESP_S1(HRESP_S1[0]),
	.HSEL_S1(HSEL_S1),
	.HADDR_S1(HADDR_S1),
	.HSIZE_S1(HSIZE_S1),
	.HTRANS_S1(HTRANS_S1), // AI : mapped two bit htrans
	.HBURST_S1(HBURST_S1), // AI : Hburst support 
	.HWRITE_S1(HWRITE_S1),
	.HWDATA_S1(HWDATA_S1),
	.HREADY_S1(HREADY_S1),
	.HMASTLOCK_S1(HMASTLOCK_S1),
	.HRDATA_S2(HRDATA_S2),
	.HREADYOUT_S2(HREADYOUT_S2),
	.HRESP_S2(HRESP_S2[0]),
	.HSEL_S2(HSEL_S2),
	.HADDR_S2(HADDR_S2),
	.HSIZE_S2(HSIZE_S2),
	.HTRANS_S2(HTRANS_S2), // AI : mapped two bit htrans
	.HBURST_S2(HBURST_S2), // AI : Hburst support 
	.HWRITE_S2(HWRITE_S2),
	.HWDATA_S2(HWDATA_S2),
	.HREADY_S2(HREADY_S2),
	.HMASTLOCK_S2(HMASTLOCK_S2),
	.HRDATA_S3(HRDATA_S3),
	.HREADYOUT_S3(HREADYOUT_S3),
	.HRESP_S3(HRESP_S3[0]),
	.HSEL_S3(HSEL_S3),
	.HADDR_S3(HADDR_S3),
	.HSIZE_S3(HSIZE_S3),
	.HTRANS_S3(HTRANS_S3),// AI : mapped two bit htrans
	.HBURST_S3(HBURST_S3), // AI : Hburst support 
	.HWRITE_S3(HWRITE_S3),
	.HWDATA_S3(HWDATA_S3),
	.HREADY_S3(HREADY_S3),
	.HMASTLOCK_S3(HMASTLOCK_S3),
	.HRDATA_S4(HRDATA_S4),
	.HREADYOUT_S4(HREADYOUT_S4),
	.HRESP_S4(HRESP_S4[0]),
	.HSEL_S4(HSEL_S4),
	.HADDR_S4(HADDR_S4),
	.HSIZE_S4(HSIZE_S4),
	.HTRANS_S4(HTRANS_S4),// AI : mapped two bit htrans
	.HBURST_S4(HBURST_S4), // AI : Hburst support 
	.HWRITE_S4(HWRITE_S4),
	.HWDATA_S4(HWDATA_S4),
	.HREADY_S4(HREADY_S4),
	.HMASTLOCK_S4(HMASTLOCK_S4),
	.HRDATA_S5(HRDATA_S5),
	.HREADYOUT_S5(HREADYOUT_S5),
	.HRESP_S5(HRESP_S5[0]),
	.HSEL_S5(HSEL_S5),
	.HADDR_S5(HADDR_S5),
	.HSIZE_S5(HSIZE_S5),
	.HTRANS_S5(HTRANS_S5),// AI : mapped two bit htrans
	.HBURST_S5(HBURST_S5), // AI : Hburst support 
	.HWRITE_S5(HWRITE_S5),
	.HWDATA_S5(HWDATA_S5),
	.HREADY_S5(HREADY_S5),
	.HMASTLOCK_S5(HMASTLOCK_S5),
	.HRDATA_S6(HRDATA_S6),
	.HREADYOUT_S6(HREADYOUT_S6),
	.HRESP_S6(HRESP_S6[0]),
	.HSEL_S6(HSEL_S6),
	.HADDR_S6(HADDR_S6),
	.HSIZE_S6(HSIZE_S6),
	.HTRANS_S6(HTRANS_S6), // AI : mapped two bit htrans
	.HBURST_S6(HBURST_S6), // AI : Hburst support 
	.HWRITE_S6(HWRITE_S6),
	.HWDATA_S6(HWDATA_S6),
	.HREADY_S6(HREADY_S6),
	.HMASTLOCK_S6(HMASTLOCK_S6),
	.HRDATA_S7(HRDATA_S7),
	.HREADYOUT_S7(HREADYOUT_S7),
	.HRESP_S7(HRESP_S7[0]),
	.HSEL_S7(HSEL_S7),
	.HADDR_S7(HADDR_S7),
	.HSIZE_S7(HSIZE_S7),
	.HTRANS_S7(HTRANS_S7), // AI : mapped two bit htrans
	.HBURST_S7(HBURST_S7), // AI : Hburst support 
	.HWRITE_S7(HWRITE_S7),
	.HWDATA_S7(HWDATA_S7),
	.HREADY_S7(HREADY_S7),
	.HMASTLOCK_S7(HMASTLOCK_S7),
	.HRDATA_S8(HRDATA_S8),
	.HREADYOUT_S8(HREADYOUT_S8),
	.HRESP_S8(HRESP_S8[0]),
	.HSEL_S8(HSEL_S8),
	.HADDR_S8(HADDR_S8),
	.HSIZE_S8(HSIZE_S8),
	.HTRANS_S8(HTRANS_S8), // AI : mapped two bit htrans
	.HBURST_S8(HBURST_S8), // AI : Hburst support 
	.HWRITE_S8(HWRITE_S8),
	.HWDATA_S8(HWDATA_S8),
	.HREADY_S8(HREADY_S8),
	.HMASTLOCK_S8(HMASTLOCK_S8),
	.HRDATA_S9(HRDATA_S9),
	.HREADYOUT_S9(HREADYOUT_S9),
	.HRESP_S9(HRESP_S9[0]),
	.HSEL_S9(HSEL_S9),
	.HADDR_S9(HADDR_S9),
	.HSIZE_S9(HSIZE_S9),
	.HTRANS_S9(HTRANS_S9), // AI : mapped two bit htrans
	.HBURST_S9(HBURST_S9), // AI : Hburst support 
	.HWRITE_S9(HWRITE_S9),
	.HWDATA_S9(HWDATA_S9),
	.HREADY_S9(HREADY_S9),
	.HMASTLOCK_S9(HMASTLOCK_S9),
	.HRDATA_S10(HRDATA_S10),
	.HREADYOUT_S10(HREADYOUT_S10),
	.HRESP_S10(HRESP_S10[0]),
	.HSEL_S10(HSEL_S10),
	.HADDR_S10(HADDR_S10),
	.HSIZE_S10(HSIZE_S10),
	.HTRANS_S10(HTRANS_S10), // AI : mapped two bit htrans
	.HBURST_S10(HBURST_S10), // AI : Hburst support 
	.HWRITE_S10(HWRITE_S10),
	.HWDATA_S10(HWDATA_S10),
	.HREADY_S10(HREADY_S10),
	.HMASTLOCK_S10(HMASTLOCK_S10),
	.HRDATA_S11(HRDATA_S11),
	.HREADYOUT_S11(HREADYOUT_S11),
	.HRESP_S11(HRESP_S11[0]),
	.HSEL_S11(HSEL_S11),
	.HADDR_S11(HADDR_S11),
	.HSIZE_S11(HSIZE_S11),
	.HTRANS_S11(HTRANS_S11), // AI : mapped two bit htrans
	.HBURST_S11(HBURST_S11), // AI : Hburst support 
	.HWRITE_S11(HWRITE_S11),
	.HWDATA_S11(HWDATA_S11),
	.HREADY_S11(HREADY_S11),
	.HMASTLOCK_S11(HMASTLOCK_S11),
	.HRDATA_S12(HRDATA_S12),
	.HREADYOUT_S12(HREADYOUT_S12),
	.HRESP_S12(HRESP_S12[0]),
	.HSEL_S12(HSEL_S12),
	.HADDR_S12(HADDR_S12),
	.HSIZE_S12(HSIZE_S12),
	.HTRANS_S12(HTRANS_S12), //// AI : mapped two bit htrans
	.HBURST_S12(HBURST_S12), //  AI : Hburst support 
	.HWRITE_S12(HWRITE_S12),
	.HWDATA_S12(HWDATA_S12),
	.HREADY_S12(HREADY_S12),
	.HMASTLOCK_S12(HMASTLOCK_S12),
	.HRDATA_S13(HRDATA_S13),
	.HREADYOUT_S13(HREADYOUT_S13),
	.HRESP_S13(HRESP_S13[0]),
	.HSEL_S13(HSEL_S13),
	.HADDR_S13(HADDR_S13),
	.HSIZE_S13(HSIZE_S13),
	.HTRANS_S13(HTRANS_S13), // AI : mapped two bit htrans
	.HBURST_S13(HBURST_S13), // AI : Hburst support 
	.HWRITE_S13(HWRITE_S13),
	.HWDATA_S13(HWDATA_S13),
	.HREADY_S13(HREADY_S13),
	.HMASTLOCK_S13(HMASTLOCK_S13),
	.HRDATA_S14(HRDATA_S14),
	.HREADYOUT_S14(HREADYOUT_S14),
	.HRESP_S14(HRESP_S14[0]),
	.HSEL_S14(HSEL_S14),
	.HADDR_S14(HADDR_S14),
	.HSIZE_S14(HSIZE_S14),
	.HTRANS_S14(HTRANS_S14), // AI : mapped two bit htrans
	.HBURST_S14(HBURST_S14), // AI : Hburst support 
	.HWRITE_S14(HWRITE_S14),
	.HWDATA_S14(HWDATA_S14),
	.HREADY_S14(HREADY_S14),
	.HMASTLOCK_S14(HMASTLOCK_S14),
	.HRDATA_S15(HRDATA_S15),
	.HREADYOUT_S15(HREADYOUT_S15),
	.HRESP_S15(HRESP_S15[0]),
	.HSEL_S15(HSEL_S15),
	.HADDR_S15(HADDR_S15),
	.HSIZE_S15(HSIZE_S15),
	.HTRANS_S15(HTRANS_S15),  // AI : mapped two bit htrans
	.HBURST_S15(HBURST_S15), // AI : Hburst support 
	.HWRITE_S15(HWRITE_S15),
	.HWDATA_S15(HWDATA_S15),
	.HREADY_S15(HREADY_S15),
	.HMASTLOCK_S15(HMASTLOCK_S15),
	.HRDATA_S16(HRDATA_S16),
	.HREADYOUT_S16(HREADYOUT_S16),
	.HRESP_S16(HRESP_S16[0]),
	.HSEL_S16(HSEL_S16),
	.HADDR_S16(HADDR_S16),
	.HSIZE_S16(HSIZE_S16),
	.HTRANS_S16(HTRANS_S16), // // AI : mapped two bit htrans
	.HBURST_S16(HBURST_S16), // AI : Hburst support 
	.HWRITE_S16(HWRITE_S16),
	.HWDATA_S16(HWDATA_S16),
	.HREADY_S16(HREADY_S16),
	.HMASTLOCK_S16(HMASTLOCK_S16)
);
endmodule 
