`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/22 21:19:12
// Design Name: 
// Module Name: AtanPoly
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//                                            
//                                             +--------------+
//                                             |              |
//                                             |              |
//                                             |    para_A    +---+
//                                             |              |   |
//                                             |    S_0_7     |   |
//                                             +--------------+   |
//                            +------+                            |
//      +--------------+      |      v         +--------------+   |                 +--------------+                    +--------------+
//      |              |      |  +-------+     |              |   |  +-------+      |              |     +-------+      |              |
//      |  atan_poly_i |      |  |       |     |  atan_poly_  |   +->|       |      |    mul_A     +---->|       |      |              |
//      |              +------+->|  mul  +---->|    pow_2     |      |  mul  +----->|              |     |  add  +----->|    angle_r   |
//      |    S_0_7     |      |  |       |     |              +----->|       |      |    S_2_21    |  +->|       |      |              |
//      |              |      |  +-------+     |    U_2_14    |      +-------+      |              |  |  +-------+      |    S_3_21    |
//      +--------------+      |                +--------------+                     +--------------+  |                 +--------------+
//                            |                                                                       |
//      +--------------+      |                +--------------+                     +--------------+  |
//      |              |      |  +-------+     |              |      +-------+      |              |  |
//      |   para_B     |      +->|       |     |    mul_B     +----->|       |      |              |  |
//      |              |         |  mul  +---->|              |      |  add  +----->|     add_C    +--+
//      |    S_0_7     +-------->|       |     |    S_0_14    |   +->|       |      |              |
//      |              |         +-------+     |              |   |  +-------+      |    S_1_14    |
//      +--------------+                       +--------------+   |                 +--------------+
//                                                                |
//                                             +--------------+   |
//                                             |              |   |
//                                             |              |   |
//                                             |    para_C    +---+
//                                             |              |
//                                             |    S_0_7     |
//                                             +--------------+
//
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//                    _   _   _   _   _   _   _   _   _   _
// clk               | |_| |_| |_| |_| |_| |_| |_| |_| |_| 
//                        ___________                      
// val_i             ____|           |_____________________
//                   ____ ___ ___ ___ _____________________
// atan_poly_i[7:0]  ____X___X___X___X_____________________
//                                            ___________  
// val_o             ________________________|           |_
//                   ________________________ ___ ___ ___ _
// atan_poly_o[15:0] ________________________X___X___X___X_
//
//////////////////////////////////////////////////////////////////////////////////


module AtanPoly(
    input           clk         ,
    input           val_i       ,
    output          val_o       ,
    input   [7:0]   atan_poly_i ,
    output  [15:0]  atan_poly_o 
    );
    
    reg [3:0] val_r = 0;
    assign val_o = val_r[2];
    always@(posedge clk) begin
      val_r[0] <= val_i;
      val_r[1] <= val_r[0];
      val_r[2] <= val_r[1];
      val_r[3] <= val_r[2];
    end

    wire [15:0] atan_poly_pow_2;
    UnsignedPow2MulWrapper unsigned_pow_2_mul(
        .data_i(atan_poly_i),
        .data_o(atan_poly_pow_2),
        .clk(clk)
    );

    wire [15:0] mul_B_w;
    reg [15:0] add_C_r = 0;
    reg [22:0] mid_res = 0;
    MulParaBWrapper mul_para_B(
      .clk        (clk) ,
      .atan_poly_i(atan_poly_i) ,
      .mul_B_p    (mul_B_w) // bring in error there
    );

    wire [22:0] mul_A_w;
    MulParaAWrapper mul_para_A(
      .clk            (clk) ,
      .atan_poly_pow_2(atan_poly_pow_2) ,
      .mul_A_p        (mul_A_w) 
    );

    assign atan_poly_o = {{3{mid_res[22]}}, mid_res[21:9]};
    always@(posedge clk) begin
        add_C_r <= mul_B_w - 16'h55 ;
        mid_res <= {add_C_r, 7'b0} + mul_A_w;
    end

endmodule
