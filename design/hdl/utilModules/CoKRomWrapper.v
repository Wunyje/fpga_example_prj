`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/22 15:41:02
// Design Name: 
// Module Name: CoKRomWrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CoKRomWrapper(
    input       clk,
    input       val_i,
    input [9:0] read_addr,
    output [19:0] para_out
    );
    
    co_K_rom co_K_rom_inst (
      .clka(clk),    // input wire clka
      .ena(val_i),
      .addra(read_addr),  // input wire [9 : 0] addra
      .douta(para_out)  // output wire [35 : 0] douta
    );
endmodule
