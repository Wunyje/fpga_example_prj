`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/22 20:12:56
// Design Name: 
// Module Name: Pow2MulWrapper
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


module Pow2MulWrapper(
    input [7:0] data_i,
    output [15:0] data_o,
    input clk
    );
    
    pow_2_mul pow_2_mul_inst (
      .CLK(clk),  // input wire CLK
      .A(data_i),      // input wire [7 : 0] A
      .B(data_i),      // input wire [7 : 0] B
      .P(data_o)      // output wire [15 : 0] P
    );
endmodule
