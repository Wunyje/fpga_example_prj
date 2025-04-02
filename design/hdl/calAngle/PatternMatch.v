`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/23 14:57:42
// Design Name: 
// Module Name: PatternMatch
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
//                      _   _   _   _   _   _   _   _   _   _
// clk                 | |_| |_| |_| |_| |_| |_| |_| |_| |_| 
//                          ___________                      
// val_i               ____|           |_____________________
//                     ____ ___ ___ ___ _____________________
// real_i[7:0]         ____X___X___X___X_____________________
//                     ____ ___ ___ ___ _____________________
// imag_i[7:0]         ____X___X___X___X_____________________
//                                              ___________  
// val_o               ________________________|           |_
//                     ________________________ ___ ___ ___ _
// into_atan_poly[7:0] ________________________X___X___X___X_
//                     ________________________ ___ ___ ___ _
// case_flag[2:0]      ________________________X___X___X___X_

//////////////////////////////////////////////////////////////////////////////////


module PatternMatch(
    input           clk         ,
    input           val_i       ,
    input [7:0]     real_i      ,
    input [7:0]     imag_i      ,
    output [7:0]    into_atan_poly,
    output [2:0]    case_flag   ,
    output          val_o       
    );

    reg [3:0] val_r = 0;
    assign    val_o = val_r[3];
    always@(posedge clk) begin
        val_r[0] <= val_i;
        val_r[1] <= val_r[0];
        val_r[2] <= val_r[1];
        val_r[3] <= val_r[2];
    end

    wire [7:0] abs_real_w = (real_i[7]? ~real_i + 1'b1 : real_i) ;
    wire [7:0] abs_imag_w = (imag_i[7]? ~imag_i + 1'b1 : imag_i) ;
    reg  [7:0] abs_real_r = 0;
    reg  [7:0] abs_imag_r = 0;
    reg        real_sign_r = 0;
    reg        imag_sign_r = 0;
    always@(posedge clk) begin
        real_sign_r <= real_i[7];
        imag_sign_r <= imag_i[7];
        abs_real_r <= abs_real_w;
        abs_imag_r <= abs_imag_w;
    end

    wire real_sign = real_sign_r;
    wire imag_sign = imag_sign_r;
    wire imag_eq_zero = (abs_imag_r == 0)?1:0;
    wire real_eq_zero = (abs_real_r == 0)?1:0;
    wire div_sign = (real_sign ^ imag_sign) & (~imag_eq_zero) & (~real_eq_zero);
    wire imag_eq_real = (((abs_real_r == abs_imag_r)&&(~imag_eq_zero))?1'b1 : 1'b0);
    wire imag_ls_real = ((abs_real_r > abs_imag_r)?1'b1 : 1'b0);
    wire imag_bg_real = ((abs_real_r < abs_imag_r)?1'b1 : 1'b0);

    wire all_zero = (~(abs_real_r && abs_imag_r)); 
    wire abs_div_within = ~div_sign;
    wire abs_div_without = ((~div_sign) && ~(real_eq_zero && (imag_sign)));

    reg [2:0]   case_flag_r = 0;
    reg [2:0]   case_flag_r_1 = 0;
    reg [15:0]  dividened_r = 0;
    reg [7:0]   divisor_r = 0;
    
    assign      case_flag = case_flag_r_1;
    
    always@(posedge clk) begin
        case_flag_r_1 <= case_flag_r;
    end
    
    always@(posedge clk) begin
        if(all_zero && val_r[1]) begin
            case_flag_r <= 0;
            dividened_r <= 0;
            divisor_r <= 1;
        end
        if((imag_ls_real || imag_eq_real) && val_r[1]) begin
            dividened_r <= {abs_imag_r, 7'b0};
            divisor_r <= abs_real_r;
            if(abs_div_within) begin
                if(real_sign)
                    case_flag_r <= 0;
                else
                    case_flag_r <= 1;
            end
            else begin
                if(real_sign)
                    case_flag_r <= 2;
                else
                    case_flag_r <= 3;
            end
        end
        if(imag_bg_real && val_r[1]) begin
            dividened_r <= {abs_real_r, 7'b0};
            divisor_r <= abs_imag_r;
            if(abs_div_without) begin
                if(real_sign)
                    case_flag_r <= 4;
                else
                    case_flag_r <= 5;
            end
            else begin
                if(real_sign)
                    case_flag_r <= 6;
                else
                    case_flag_r <= 7;
            end
        end   
    end

    wire    [23:0]  div_res;
    wire            div_val_o;
    assign          into_atan_poly = div_res[15:8];
    CalAngleDivWrapper CalAngleDiv(
        .clk      (clk) ,
        .dividened(dividened_r) ,  // [15:0]
        .divisor  (divisor_r) ,  // [7:0]
        .val_i    (val_r[2]) ,
        .val_o    (div_val_o) ,
        .div_res  (div_res)    // [23:0]
    );

endmodule
