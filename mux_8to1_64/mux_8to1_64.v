module mux_8to1_64(F, S, i0, i1, i2, i3, i4, i5, i6, i7);
	input [63:0] i0, i1, i2, i3, i4, i5, i6, i7;
	input [2:0] S;
	output [63:0] F;
	
	assign F = S[2] ? (S[1] ? (S[0] ? i7 : i6) : (S[0] ? i5 : i4))
						 : (S[1] ? (S[0] ? i3 : i2) : (S[0] ? i1 : i0));
endmodule
