`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/22 21:45:06
// Design Name: 
// Module Name: mul_8_8_wrapper
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


module MulParaBWrapper(
    input           clk         ,
    input [7:0]     atan_poly_i ,
    output [15:0]   mul_B_p     
    );
    
   mul_para_B mul_para_B_inst (
      .CLK(clk),  // input wire CLK
      .A(atan_poly_i),      // input wire [7 : 0] A
      .P(mul_B_p)      // output wire [15 : 0] P
    );
endmodule
