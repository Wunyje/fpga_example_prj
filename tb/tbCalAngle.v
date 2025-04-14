`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/24 13:21:27
// Design Name: 
// Module Name: tbCalAngle
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


module tbCalAngle();
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
    reg [15:0]   res_angle_cal_out_mem [0:N-1]; 

    integer     file_real_value; // file_real_value handle
    integer     file_imag_value; // file_real_value handle
    integer     file_res_angle_cal_out; // file_res_angle_cal_out handle
    integer     cnt; // counter
    
    
    // read stimulus and result from file_real_value
    initial begin
        file_real_value = $fopen("E:\\_local_files\\prjs\\util_prj\\example_prj\\txt\\input_real_value.txt", "r");
        file_imag_value = $fopen("E:\\_local_files\\prjs\\util_prj\\example_prj\\txt\\input_imag_value.txt", "r");
        file_res_angle_cal_out = $fopen("E:\\_local_files\\prjs\\util_prj\\example_prj\\txt\\res_angle_cal_res.txt", "r");
        cnt = 0;
        while (!$feof(file_real_value)) begin
            $fscanf(file_real_value, "%h", real_mem[cnt]);
            $fscanf(file_imag_value, "%h", imag_mem[cnt]);
            $fscanf(file_res_angle_cal_out, "%h", res_angle_cal_out_mem[cnt]);
            cnt = cnt + 1;
        end
        $fclose(file_real_value);
        $fclose(file_imag_value);
        $fclose(file_res_angle_cal_out);
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
    wire [15:0]	angle_o;
    wire        val_o;
    CalAngle CalAngleInst(
        .clk    (clk),
        .val_i  (val_i),
        .real_i (real_i),
        .imag_i (imag_i),
        .angle_o(angle_o),
        .val_o  (val_o)
    );

    // Check the result
    integer        i_check = 0;
    wire    [15:0] ref_angle_o = res_angle_cal_out_mem[i_check];
    wire    [15:0] sim_err = (ref_angle_o > angle_o) ? ref_angle_o - angle_o: angle_o - ref_angle_o;
    initial begin
        forever@(posedge clk) begin
            if(val_o) begin
                i_check <= i_check + 1;
                if(sim_err > 1) begin
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
