module decoder_2to4(o, i, en);
	input [1:0] i;
	input en;
	output [3:0] o;
	
	assign
		o[0] = ~i[1] & ~i[0] & en,
		o[1] = ~i[1] &  i[0] & en,
		o[2] =  i[1] & ~i[0] & en,
		o[3] =  i[1] &  i[0] & en;
		
endmodule
