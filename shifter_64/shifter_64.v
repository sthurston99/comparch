module shifter_64(A, shift_amount, L, R);
	input [63:0] A;
	input [5:0] shift_amount;
	output [63:0] L, R;
	
	assign L = A << shift_amount;
	assign R = A >> shift_amount;
endmodule
