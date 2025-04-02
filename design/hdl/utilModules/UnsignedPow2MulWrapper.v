`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/23 13:06:37
// Design Name: 
// Module Name: UnsignedPow2MulWrapper
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


module UnsignedPow2MulWrapper(
    input           clk     ,
    input   [7:0]   data_i  ,
    output  [15:0]  data_o
    );
    
    unsigned_pow_2_mul uns_pow_2_mul_inst (
      .CLK(clk),  // input wire CLK
      .A(data_i),      // input wire [7 : 0] A
      .B(data_i),      // input wire [7 : 0] B
      .P(data_o)      // output wire [15 : 0] P
    );
    
endmodule
