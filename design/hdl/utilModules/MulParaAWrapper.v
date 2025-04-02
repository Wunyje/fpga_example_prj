`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/22 22:02:38
// Design Name: 
// Module Name: MulParaAWrapper
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


module MulParaAWrapper(
    input           clk             ,
    input [15:0]    atan_poly_pow_2 ,
    output [22:0]   mul_A_p         
    );
    
   mul_para_A mul_para_A_inst (
      .CLK(clk),  // input wire CLK
      .A(atan_poly_pow_2),      // input wire [15 : 0] A
      .P(mul_A_p)      // output wire [22 : 0] P
    );
endmodule
