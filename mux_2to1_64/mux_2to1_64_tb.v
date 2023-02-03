`timescale 1ns/1ps
module mux_2to1_64_tb;
	reg [63:0] i0, i1;
	reg s;
	wire [63:0] o;
	
	mux_2to1_64 uut (.i0(i0), .i1(i1), .s(s), .o(o));
	
	initial begin
		i0 = 64'hAAAAAAAAAAAAAAAA;
		i1 = 64'h5555555555555555;
		s = 0;
		#10
		s = 1;
		#10 $stop;
	end
endmodule
