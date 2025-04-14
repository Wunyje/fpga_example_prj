`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/22 17:31:43
// Design Name: 
// Module Name: tbSqrtLut
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - file_sqrt_in Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tbSqrtLut();
    localparam  N = 1024;

    reg 					clk = 1;
	localparam period = 10; 
	initial begin
	   forever begin
		 #(period/2) clk = ~clk;
	   end
	end
    reg [15:0]  sqrt_in_mem [0:N-1]; 
    reg [7:0]   sqrt_out_mem [0:N-1]; 
    integer     file_sqrt_in; // file_sqrt_in handle
    integer     file_sqrt_out; // file_sqrt_out handle
    integer     cnt; // counter
    
    
    // read stimulus and result from file_sqrt_in
    initial begin
        file_sqrt_in = $fopen("E:\\_local_files\\prjs\\util_prj\\example_prj\\txt\\mid_sqrt_in.txt", "r");
        file_sqrt_out = $fopen("E:\\_local_files\\prjs\\util_prj\\example_prj\\txt\\res_sqrt_out.txt", "r");
        cnt = 0;
        while (!$feof(file_sqrt_in)) begin
            $fscanf(file_sqrt_in, "%h", sqrt_in_mem[cnt]);
            $fscanf(file_sqrt_out, "%h", sqrt_out_mem[cnt]);
            cnt = cnt + 1;
        end
        $fclose(file_sqrt_in);
        $fclose(file_sqrt_out);
    end
    
    // output stimulus on rising edge of clock
    reg [9:0]   addr = 0; // address of current stimulus sqrt_lut_in_data
    reg [15:0]  sqrt_lut_in_data = 0; // stimulus sqrt_lut_in_data
    reg			valid_i	= 0;
    initial begin
        # 100 valid_i	= 1;
        forever@(posedge clk) begin
            addr <= addr + 1;
            sqrt_lut_in_data <= sqrt_in_mem[addr];
        end
    end
    
    // Instantiation
    wire [7:0]  sqrt_lut_o;
	wire		valid_o;
    SqrtLut SqrtLutInst(
        .clk(clk),
        .sqrt_lut_i(sqrt_lut_in_data),
        .val_i(valid_i),
        .sqrt_lut_o(sqrt_lut_o),
        .val_o(valid_o)
        );
    
    // Check the result
    integer i_check = 0;
    wire [7:0] ref_sqrt_lut_o = sqrt_out_mem[i_check];
    initial begin
        forever@(posedge clk) begin
            if(valid_o) begin
                i_check <= i_check + 1;
                if(ref_sqrt_lut_o !=  sqrt_lut_o) begin
                    $display("There is a problem at %d. Simulation stopped.", cnt);
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

