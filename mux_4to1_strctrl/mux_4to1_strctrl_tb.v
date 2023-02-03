`timescale 1ns/1ps
module mux_4to1_strctrl_tb;
	reg [3:0] i;
	reg [1:0] s;
	
	wire o;
	
	mux_4to1_strctrl uut (.i(i), .s(s), .o(o));
	
	initial begin
		#10 i = 4'b1010;
		#10 s = 2'b00;
		#10 s = 2'b01;
		#10 s = 2'b10;
		#10 s = 2'b11;
		#10 $stop;
	end
endmodule
