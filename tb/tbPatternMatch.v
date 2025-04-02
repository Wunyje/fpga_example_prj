`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 09:45:22
// Design Name: 
// Module Name: tbPatternMatch
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


module tbPatternMatch();
    localparam  N = 1024;

    reg 	   clk = 1;
	localparam period = 10; 
	initial begin
	   forever begin
		 #(period/2) clk = ~clk;
	   end
	end
    reg [7:0]   real_mem [0:N-1]; 
    reg [7:0]   imag_mem [0:N-1]; 
    reg [7:0]   mid_atan_out_mem [0:N-1]; 
    reg [2:0]   case_flag_out_mem [0:N-1]; 

    integer     file_real_value; // file_real_value handle
    integer     file_imag_value; // file_real_value handle
    integer     file_mid_atan_out; // file_mid_atan_out handle
    integer     file_case_flag_out; // file_mid_atan_out handle
    integer     cnt; // counter
    
    
    // read stimulus and result from file_real_value
    initial begin
        file_real_value = $fopen("/media/aaa/I/_ELSE/fpga_prj/fpga_design_course/task_3/design_src/src.c/para_and_res/input_real_value.txt", "r");
        file_imag_value = $fopen("/media/aaa/I/_ELSE/fpga_prj/fpga_design_course/task_3/design_src/src.c/para_and_res/input_imag_value.txt", "r");
        file_mid_atan_out = $fopen("/media/aaa/I/_ELSE/fpga_prj/fpga_design_course/task_3/design_src/src.c/para_and_res/mid_atan_out.txt", "r");
        file_case_flag_out = $fopen("/media/aaa/I/_ELSE/fpga_prj/fpga_design_course/task_3/design_src/src.c/para_and_res/mid_case_flag_out.txt", "r");
        cnt = 0;
        while (!$feof(file_real_value)) begin
            $fscanf(file_real_value, "%h", real_mem[cnt]);
            $fscanf(file_imag_value, "%h", imag_mem[cnt]);
            $fscanf(file_mid_atan_out, "%h", mid_atan_out_mem[cnt]);
            $fscanf(file_case_flag_out, "%h", case_flag_out_mem[cnt]);
            cnt = cnt + 1;
        end
        $fclose(file_real_value);
        $fclose(file_imag_value);
        $fclose(file_mid_atan_out);
        $fclose(file_case_flag_out);
    end
    
    // output stimulus on rising edge of clock
    reg [9:0]   addr = 0; // address of current stimulus real_i
    reg [7:0]   real_i = 0; // stimulus real_i
    reg [7:0]   imag_i = 0; // stimulus imag_i
    reg			val_i	= 0;
    initial begin
        # 100 val_i	= 1;
        forever@(posedge clk) begin
            addr <= addr + 1;
            real_i <= real_mem[addr];
            imag_i <= imag_mem[addr];
        end
    end
    
    // Instantiation
    wire [2:0]  case_flag;
	wire [7:0]	into_atan_poly;
	wire        val_o;
    PatternMatch PatternMatchInst(
        .clk         (clk),
        .val_i       (val_i),
        .real_i      (real_i),
        .imag_i      (imag_i),
        .into_atan_poly(into_atan_poly),
        .case_flag   (case_flag),
        .val_o       (val_o)
    );

    // Check the result
    integer        i_check = 0;
    wire    [7:0]  ref_into_atan_poly = mid_atan_out_mem[i_check];
    wire    [2:0]  ref_case_flag = case_flag_out_mem[i_check];
    initial begin
        forever@(posedge clk) begin
            if(val_o) begin
                i_check <= i_check + 1;
                if((ref_into_atan_poly !=  into_atan_poly)|| (ref_case_flag != case_flag)) begin
                    $display("There is a problem at %d. Simulation stopped.", i_check + 1);
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
