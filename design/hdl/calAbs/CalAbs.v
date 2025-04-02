`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/22 20:09:05
// Design Name: 
// Module Name: CalAbs
// Project Name: 
// Target Devices: xa7a12tcpg238-2I
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//              _   _   _   _   _   _   _   _   _   _
// clk         | |_| |_| |_| |_| |_| |_| |_| |_| |_| 
//                  ___________                      
// val_i       ____|           |_____________________
//             ____ ___ ___ ___ _____________________
// real_i[7:0] ____X___X___X___X_____________________
//             ____ ___ ___ ___ _____________________
// imag_i[7:0] ____X___X___X___X_____________________
//                                      ___________  
// val_o       ________________________|           |_
//             ________________________ ___ ___ ___ _
// abs_o[7:0]  ________________________X___X___X___X_
//
// delay: 3clk
//////////////////////////////////////////////////////////////////////////////////


module CalAbs(
    input           clk     ,
    input           val_i   ,
    input [7:0]     real_i  ,
    input [7:0]     imag_i  ,
    output [7:0]    abs_o   ,
    output          val_o
    );
    wire [15:0] real_pow_2_w;
    wire [15:0] imag_pow_2_w;
    Pow2MulWrapper real_pow_2_mul(
        .data_i(real_i),
        .data_o(real_pow_2_w),
        .clk(clk)
    );

    Pow2MulWrapper imag_pow_2_mul(
        .data_i(imag_i),
        .data_o(imag_pow_2_w),
        .clk(clk)
    );

    reg [15:0] real_pow_2_r = 0;
    reg [15:0] imag_pow_2_r = 0;
    reg        val_r = 0;
    always@(posedge clk) begin
        real_pow_2_r <= real_pow_2_w;
        imag_pow_2_r <= imag_pow_2_w;
        val_r <= val_i;
    end

    wire [15:0] sqrt_lut_in = real_pow_2_w + imag_pow_2_w;
    sqrt_lut sqrt_lut_inst(
        .clk(clk),
        .sqrt_lut_i(sqrt_lut_in),
        .val_i(val_r),
        .sqrt_lut_o(abs_o),
        .val_o(val_o)
    );

endmodule
