`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: begin 
// Engineer: begin 
// 
// Create Date: begin 2023/04/23 13: begin25: begin10
// Design Name: begin 
// Module Name: begin CalAngle
// Project Name: begin 
// Target Devices: begin 
// Tool Versions: begin 
// Description: begin 
// 
// Dependencies: begin 
// 
// Revision: begin
// Revision 0.01 - File Created
// Additional Comments: begin
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
// angle_o[15:0] ________________________X___X___X___X_
// 
// delay: 7clk
//////////////////////////////////////////////////////////////////////////////////


module CalAngle(
    input           clk     ,
    input           val_i   ,
    input  [7: 0]   real_i  ,
    input  [7: 0]   imag_i  ,
    output [15: 0]  angle_o ,
    output          val_o   
    );
    
    wire [2: 0] case_flag;
	wire [7: 0]	into_atan_poly;
	wire        pattern_match_val_o;
    PatternMatch PatternMatchInst(
        .clk            (clk),
        .val_i          (val_i),
        .real_i         (real_i),
        .imag_i         (imag_i),
        .into_atan_poly (into_atan_poly),
        .case_flag      (case_flag),
        .val_o          (pattern_match_val_o)
    );

    wire [15: 0] atan_poly_o;
    wire		 atan_poly_val_o;
    AtanPoly AtanPolyInst(
        .clk        (clk) ,
        .val_i      (pattern_match_val_o) ,
        .val_o      (atan_poly_val_o) ,
        .atan_poly_i(into_atan_poly) ,
        .atan_poly_o(atan_poly_o) 
    );
    
    reg   [1:0] val_r = 0;
    assign      val_o = val_r[0];
    always@(posedge clk) begin
        val_r[0] <= atan_poly_val_o;
        val_r[1] <= val_r[0];
    end 
    
    reg [15:0] pi_div_2_fix  = 16'd6434;
    reg [15:0] pi_fix        = 16'd12868;
    reg [15:0] angle_r       = 0;
    reg [15:0] atan_poly_o_r = 0;
    reg [15:0] pi_para_r     = 0;
    reg [8:0]  case_flag_r   = 0;
    always@(posedge clk) begin
        case_flag_r[2:0] <= case_flag;
        case_flag_r[5:3] <= case_flag_r[2:0];
        case_flag_r[8:6] <= case_flag_r[5:3];
    end

    always@(*) begin
        case(case_flag_r[8:6]) 
            0: begin 
                atan_poly_o_r =  atan_poly_o; 
                pi_para_r     =  -pi_fix; 
            end
            1 : begin 
                atan_poly_o_r =  atan_poly_o; 
                pi_para_r     =  0; 
            end 
            2 : begin 
                atan_poly_o_r =  -atan_poly_o; 
                pi_para_r     =  pi_fix; 
            end 
            3 : begin 
                atan_poly_o_r =  -atan_poly_o; 
                pi_para_r     =  0; 
            end
            4 : begin 
                atan_poly_o_r =  -atan_poly_o; 
                pi_para_r     =  -pi_div_2_fix; 
            end
            5 : begin 
                atan_poly_o_r =  -atan_poly_o; 
                pi_para_r     =  pi_div_2_fix; 
            end
            6 : begin 
                atan_poly_o_r =  atan_poly_o; 
                pi_para_r     =  pi_div_2_fix; 
            end
            7 : begin 
                atan_poly_o_r =  atan_poly_o; 
                pi_para_r     =  -pi_div_2_fix; 
            end
            default : begin
                atan_poly_o_r =  atan_poly_o; 
                pi_para_r     =  0; 
            end
        endcase
    end

    assign      angle_o = angle_r;
    always@(posedge clk) begin
        angle_r <= (atan_poly_val_o)?(atan_poly_o_r + pi_para_r):0;
    end
endmodule
