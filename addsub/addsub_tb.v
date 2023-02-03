`timescale 1ns/1ps
module addsub_tb;
	reg [7:0] a, b;
	reg s, clk;
	wire [8:0] o;
	
	addsub uut (.a(a), .b(b), .s(s), .clk(clk), .o(o));
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		a = 8'b10011111; //159
		b = 8'b11111010; //250
		s = 1'b1;
		#10
		s = 1'b0;
		#10
		a = 8'b00010100; //20
		b = 8'b01101000; //104
		s = 1'b1;
		#10
		s = 1'b0;
		#10 $stop;
	end
endmodule
