`timescale 1ns/1ps
module decoder_4to16_tb;
	wire [15:0] o;
	reg [3:0] i;
	
	decoder_4to16 uut (.o(o), .i(i));
	
	initial begin
	#10 i = 4'b0;
		while (1) begin
			#10 i = i + 1;
			if (i == 4'b1111) begin
				#10;
				$stop;
			end
		end
	end
endmodule
