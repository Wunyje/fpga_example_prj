`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/22 15:02:50
// Design Name: 
// Module Name: sqrt_lut
// Project Name: 
// Target Devices: xa7a12tcpg238-2I
// Tool Versions: 
// Description: 
// 
//           +-----------+                       +-----------+
//           |           |                       |           |
//           |           |                       |           |
//           |   K-rom   |                       |   B-rom   |
//           |           +------------+          |           +------------+
//           |   S_0_7   |            |          |   S_0_7   |            |
//           |           |            |          |           |            |
//           |           |            |          |           |            |
//           +-----------+            |          +-----------+            |
//                                    |                                   |
//                                    |                                   |
//          +--------------+          v         +--------------+          v          +--------------+
//          |              |      +-------+     |              |      +-------+      |              |
//          |   sqrt_in    |      |       |     |    mul_K     |      |       |      |    add_B     |
//          |              +----->|  mul  +---->|              +----->|  add  +----->|              |
//          |    U_1_14    |      |       |     |    S_0_21    |      |       |      |    U_2_21    |
//          |              |      +-------+     |              |      +-------+      |              |
//          +--------------+                    +--------------+                     +--------------+
//          
//             
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//                   _   _   _   _   _   _   _   _   _   _
// clk              | |_| |_| |_| |_| |_| |_| |_| |_| |_| 
//                       ___________                      
// val_i            ____|           |_____________________
//                  ____ ___ ___ ___ _____________________
// sqrt_lut_i[15:0] ____X___X___X___X_____________________
//                                           ___________  
// val_o            ________________________|           |_
//                  ________________________ ___ ___ ___ _
// sqrt_lut_o[15:0] ________________________X___X___X___X_
//
// delay: 2clk
//////////////////////////////////////////////////////////////////////////////////


module sqrt_lut(
    input        clk,
    input [15:0] sqrt_lut_i,
    input        val_i,
    output [7:0] sqrt_lut_o,
    output       val_o
    );
    reg  [2:0]  val_r = 0;
    assign      val_o = val_r[2];
    always@(posedge clk) begin
        val_r[0] <= val_i;
        val_r[1] <= val_r[0];
        val_r[2] <= val_r[1];
    end
    
    wire [19:0] co_K;
    wire [15:0] co_B;
    CoKRomWrapper co_K_rom_inst(
        .clk(clk),
        .val_i(val_r[0]),
        .read_addr(sqrt_lut_i[13:4]),
        .para_out(co_K)
    );
    
    CoBRomWrapper co_B_rom_inst(
        .clk(clk),
        .val_i(val_r[1]),
        .read_addr(sqrt_lut_i_r[13:4]),
        .para_out(co_B)
    );
    
    reg [15:0] sqrt_lut_i_r = 0;
    reg [15:0] sqrt_lut_i_r_1 = 0;
    always@(posedge clk) begin
        sqrt_lut_i_r <= sqrt_lut_i;
        sqrt_lut_i_r_1 <= sqrt_lut_i_r;
    end
    
    wire [29:0] mid_mul_K;
    MulKGen0Wrapper mul_k(
        .clk(clk),
        .co_K(co_K),
        .sqrt_poly_in(sqrt_lut_i_r),
        .mid_mul_K(mid_mul_K)
    );
    
    wire [29:0] mid_add_B = mid_mul_K + {co_B, 14'b0};
    reg  [29:0] mid_add_B_r = 0;
    always@(posedge clk) begin
        if(val_r[1])
            mid_add_B_r <= mid_add_B;
        else
            mid_add_B_r <= 0;
    end
    assign      sqrt_lut_o = mid_add_B[28:21];
    
endmodule
