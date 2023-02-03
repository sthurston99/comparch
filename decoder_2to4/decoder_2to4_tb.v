`timescale 1ns/1ps
module decoder_2to4_tb;
	wire [3:0] o;
	reg [1:0] i;
	reg en;
	
	decoder_2to4 uut (.o(o), .i(i), .en(en));
	
	initial begin
		#10 en = 0;
		#10 i = 2'b00;
		#10 i = 2'b01;
		#10 i = 2'b10;
		#10 i = 2'b11;
		#10 en = 1;
			i = 2'b00;
		#10 i = 2'b01;
		#10 i = 2'b10;
		#10 i = 2'b11;
		#10 i = 2'b00;
		#10 $stop;
	end
endmodule
