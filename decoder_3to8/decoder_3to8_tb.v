`timescale 1ns/1ps
module decoder_3to8_tb;
	wire [7:0] o;
	reg [2:0] i;
	reg en;
	
	decoder_3to8 uut (.o(o), .i(i), .en(en));
	
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
		#10 $stop;
	end
endmodule
