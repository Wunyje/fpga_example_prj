`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/23 16:40:50
// Design Name: 
// Module Name: CalAngleDivWrapper
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


module CalAngleDivWrapper(
    input         clk       ,
    input [15:0]  dividened ,
    input [7:0]   divisor   ,  
    input         val_i     ,
    output        val_o     ,
    output [23:0] div_res 
    );
    
    cal_angle_div cal_angle_div_inst (
      .aclk(clk),                                      // input wire aclk
      .s_axis_divisor_tvalid(val_i),                    // input wire s_axis_divisor_tvalid
      .s_axis_divisor_tdata(divisor),      // input wire [7 : 0] s_axis_divisor_tdata
      .s_axis_dividend_tvalid(val_i),  // input wire s_axis_dividend_tvalid
      .s_axis_dividend_tdata(dividened),    // input wire [15 : 0] s_axis_dividend_tdata
      .m_axis_dout_tvalid(val_o),          // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(div_res)            // output wire [23 : 0] m_axis_dout_tdata
    );
endmodule
