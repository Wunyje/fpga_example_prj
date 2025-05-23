// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Wed Apr  2 21:12:56 2025
// Host        : DESKTOP-D35OAN4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/_local_files/prjs/util_prj/example_prj/design/ip/co_K_rom/co_K_rom_stub.v
// Design      : co_K_rom
// Purpose     : Stub declaration of top-level module interface
// Device      : xa7a12tcpg238-2I
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_6,Vivado 2023.1" *)
module co_K_rom(clka, ena, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="ena,addra[9:0],douta[19:0]" */
/* synthesis syn_force_seq_prim="clka" */;
  input clka /* synthesis syn_isclock = 1 */;
  input ena;
  input [9:0]addra;
  output [19:0]douta;
endmodule
