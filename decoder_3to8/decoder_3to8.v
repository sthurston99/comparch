module decoder_3to8(o, i, en);
	input [2:0] i;
	input en;
	output [7:0] o;
	
	assign
		o[0] = ~i[2] &  i[1] &  i[0] & en,
		o[1] = ~i[2] &  i[1] & ~i[0] & en,
		o[2] = ~i[2] & ~i[1] &  i[0] & en,
		o[3] = ~i[2] & ~i[1] & ~i[0] & en,
		o[4] =  i[2] &  i[1] &  i[0] & en,
		o[5] =  i[2] &  i[1] & ~i[0] & en,
		o[6] =  i[2] & ~i[1] &  i[0] & en,
		o[7] =  i[2] & ~i[1] & ~i[0] & en;
		
endmodule
