`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/22 17:16:21
// Design Name: 
// Module Name: CoBRomWrapper
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


module CoBRomWrapper(
    input clk,
    input val_i,
    input [9:0] read_addr,
    output [15:0] para_out
    );
    
    co_B_rom co_B_rom_inst (
      .clka(clk),    // input wire clka
      .ena(val_i),
      .addra(read_addr),  // input wire [9 : 0] addra
      .douta(para_out)  // output wire [35 : 0] douta
    );
endmodule
