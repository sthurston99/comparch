`timescale 1ns/1ps
module regfile_4x16_tb;
	reg clk, w;
	reg [2:0] wa, raA, raB;
	reg [15:0] wd;
	wire [15:0] rdA, rdB;
		
	regfile_4x16 uut (.clk(clk), .w(w), .wa(wa), .raA(raA),
							.raB(raB), .wd(wd), .rdA(rdA), .rdB(rdB));
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		w = 1;
		wa = 0;
		wd = 16'b1010101010101010;
		#10
		wa = 1;
		wd = 16'b0101010101010101;
		#10
		w = 0;
		raA = 0;
		raB = 1;
		#10
		w = 1;
		wa = 3;
		wd = rdA;
		#10
		wa = 2;
		wd = rdB;
		#10
		w = 0;
		raA = 2;
		raB = 3;
		#10 $stop;
	end
endmodule
