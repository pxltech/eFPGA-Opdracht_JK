// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon May 25 16:43:53 2020
// Host        : DESKTOP-8QCEB0E running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/eFPGA/OPDRACHT_2/2/EX_2_MATRIX/EX_2_MATRIX.srcs/sources_1/bd/design_1/ip/design_1_vhdlnoclk_0_0/design_1_vhdlnoclk_0_0_stub.v
// Design      : design_1_vhdlnoclk_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z007sclg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "vhdlnoclk,Vivado 2019.2" *)
module design_1_vhdlnoclk_0_0(clk65MHz)
/* synthesis syn_black_box black_box_pad_pin="clk65MHz" */;
  output clk65MHz;
endmodule
