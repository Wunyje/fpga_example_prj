`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/22 15:39:40
// Design Name: 
// Module Name: MulKGen0Wrapper
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


module MulKGen0Wrapper(
    input        clk,
    input [19:0] co_K,
    input [15:0] sqrt_poly_in,
    output [29:0] mid_mul_K
    );
    
    mult_k_gen_0 mult_k_gen_0_inst (
      .CLK(clk),  // input wire CLK
      .A(sqrt_poly_in),      // input wire [15 : 0] A
      .B(co_K),      // input wire [19 : 0] B
      .P(mid_mul_K)      // output wire [29 : 0] P
    );
endmodule
