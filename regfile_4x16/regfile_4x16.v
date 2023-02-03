`timescale 1ns/1ns
module regfile_4x16
	(input clk,
	 input w,
	 input [2:0] wa,
	 input [15:0] wd,
	 input [2:0] raA,
	 output [15:0] rdA,
	 input [2:0] raB,
	 output [15:0] rdB);
	 
	reg [15:0] r0, r1, r2, r3;
	 
	assign rdA = raA == 0 ? r0 :
					 raA == 1 ? r1 :
					 raA == 2 ? r2 :
					 raA == 3 ? r3 : 0;
	assign rdB = raB == 0 ? r0 :
					 raB == 1 ? r1 :
					 raB == 2 ? r2 :
					 raB == 3 ? r3 : 0;
						 
	always @(posedge clk) begin
		if(w)
			case(wa)
				0: r0 <= wd;
				1: r1 <= wd;
				2: r2 <= wd;
				3: r3 <= wd;
			endcase
	end
endmodule
