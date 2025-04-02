`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/23 09:35:59
// Design Name: 
// Module Name: tbAtanPoly
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


module tbAtanPoly();
    localparam  N = 1024;

    reg 					clk = 1;
	localparam period = 10; 
	initial begin
	   forever begin
		 #(period/2) clk = ~clk;
	   end
	end
    reg [7:0]  atan_in_mem [0:N-1]; 
    reg [15:0]   atan_out_mem [0:N-1]; 
    integer     file_atan_in; // file_atan_in handle
    integer     file_atan_out; // file_atan_out handle
    integer     cnt; // counter
    
    
    // read stimulus and result from file_atan_in
    initial begin
        file_atan_in = $fopen("/media/aaa/I/_ELSE/fpga_prj/fpga_design_course/task_3/design_src/src.c/para_and_res/mid_atan_in.txt", "r");
        file_atan_out = $fopen("/media/aaa/I/_ELSE/fpga_prj/fpga_design_course/task_3/design_src/src.c/para_and_res/res_atan_out.txt", "r");
        cnt = 0;
        while (!$feof(file_atan_in)) begin
            $fscanf(file_atan_in, "%h", atan_in_mem[cnt]);
            $fscanf(file_atan_out, "%h", atan_out_mem[cnt]);
            cnt = cnt + 1;
        end
        $fclose(file_atan_in);
        $fclose(file_atan_out);
    end
    
    // output stimulus on rising edge of clock
    reg [9:0]   addr = 0; // address of current stimulus atan_poly_in_data
    reg [7:0]  atan_poly_in_data = 0; // stimulus atan_poly_in_data
    reg			val_i	= 0;
    initial begin
        # 100 val_i	= 1;
        forever@(posedge clk) begin
            addr <= addr + 1;
            atan_poly_in_data <= atan_in_mem[addr];
        end
    end
    
    // Instantiation
    wire [15:0] atan_poly_o;
    wire		val_o;
    AtanPoly AtanPolyInst(
        .clk        (clk) ,
        .val_i      (val_i) ,
        .val_o      (val_o) ,
        .atan_poly_i(atan_poly_in_data) ,
        .atan_poly_o(atan_poly_o) 
    );
    
    // Check the result
    integer i_check = 0;
    wire [15:0] ref_atan_poly_o = atan_out_mem[i_check];
    initial begin
        forever@(posedge clk) begin
            if(val_o) begin
                i_check <= i_check + 1;
                if(ref_atan_poly_o !=  atan_poly_o) begin
                    $display("There is a problem at index %d. Simulation stopped.", i_check);
                    $stop( 0 ) ;
                end
                else if(i_check == N-1) begin
                    $display("Test passed.");
                    $finish( 0 ) ;
                end
            end
        end
    end

endmodule
