`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 14:40:40
// Design Name: 
// Module Name: CalAbsAngle
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
//                _   _   _   _   _   _   _   _   _   _
// clk           | |_| |_| |_| |_| |_| |_| |_| |_| |_| 
//                    ___________                      
// val_i         ____|           |_____________________
//               ____ ___ ___ ___ _____________________
// real_i[7:0]   ____X___X___X___X_____________________
//               ____ ___ ___ ___ _____________________
// imag_i[7:0]   ____X___X___X___X_____________________
//                                        ___________  
// val_o         ________________________|           |_
//               ________________________ ___ ___ ___ _
// abs_o[7:0]    ________________________X___X___X___X_
//               ________________________ ___ ___ ___ _
// angle_o[15:0] ________________________X___X___X___X_
// 
// delay: 7clk
//////////////////////////////////////////////////////////////////////////////////


module CalAbsAngle(
    input           clk     ,
    input [7:0]     real_i  ,
    input [7:0]     imag_i  ,
    input           val_i   ,
    output [7:0]    abs_o   ,
    output [15:0]   angle_o ,
    output          val_o   
    );
    
    wire        cal_abs_val_o;
    wire[7:0]   cal_abs_o;
    reg [7:0]   abs_o_r[4:0];
    CalAbs CalAbsInst(
        .clk   (clk),
        .val_i (val_i),
        .real_i(real_i),
        .imag_i(imag_i),
        .abs_o (cal_abs_o),
        .val_o (cal_abs_val_o)
    );

    assign abs_o = abs_o_r[3];
    always@(posedge clk) begin
        abs_o_r[0] <= cal_abs_o;
        abs_o_r[1] <= abs_o_r[0];
        abs_o_r[2] <= abs_o_r[1];
        abs_o_r[3] <= abs_o_r[2];
        abs_o_r[4] <= abs_o_r[3];
    end
    
    wire cal_angle_val_o;
    CalAngle CalAngleInst(
        .clk    (clk),
        .val_i  (val_i),
        .real_i (real_i),
        .imag_i (imag_i),
        .angle_o(angle_o),
        .val_o  (cal_angle_val_o)
    );
    
    assign val_o = cal_angle_val_o;
endmodule
