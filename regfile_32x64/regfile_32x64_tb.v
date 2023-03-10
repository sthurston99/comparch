`timescale 1ns/1ps
module regfile_32x64_tb;
	wire [63:0] rdA, rdB;
	reg [63:0] wd;
	reg [4:0] raA, raB, wa;
	reg w, rst, clk;
	wire [15:0] test0, test1, test2, test3, test4, test5, test6, test7;
	
	regfile_32x64 uut (
	.rdA(rdA),
	.rdB(rdB),
	.raA(raA),
	.raB(raB),
	.w(w),
	.wd(wd),
	.wa(wa),
	.rst(rst),
	.clk(clk),
	.test0(test0),
	.test1(test1),
	.test2(test2),
	.test3(test3),
	.test4(test4),
	.test5(test5),
	.test6(test6),
	.test7(test7));
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	/*
	initial begin
		rst = 0;
		w = 1;
		wa = 0;
		wd = 64'hAAAAAAAAAAAAAAAA;
		#10
		wa = 1;
		wd = 64'h5555555555555555;
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
		#10
		rst = 1;
		#10
		raA = 0;
		raB = 1;
		#10 $stop;
	end
	*/
	
	initial begin
		rst = 0;
		w = 1;
		wa = 11;
		wd = 11;
		#10
		raA = 11;
		raB = 11;
		#10
		wd = 22;
		#10 $stop;
	end
	
endmodule
