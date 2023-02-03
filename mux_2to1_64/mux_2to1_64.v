module mux_2to1_64(o, s, i0, i1);
	input s;
	input [63:0] i0, i1;
	output [63:0] o;
	
	assign o = s ? i1 : i0;
endmodule
