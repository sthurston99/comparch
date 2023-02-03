`timescale 1ns/1ps
module prog_cnt_tb;
	reg clk, rst;
	reg [1:0] PS;
	reg [15:0] in;
	wire [15:0] PC;
	
	prog_cnt uut (.clk(clk), .rst(rst), .PS(PS), .in(in), .PC(PC));
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		rst = 0;
		PS = 2'b00;
		in = 34;
		#10
		PS = 2'b10;
		#10
		in = 26;
		PS = 2'b01;
		#10
		PS = 2'b11;
		#10 $stop;
	end
	
endmodule
