module tsb_64(
	input [63:0] in,
	output [63:0] out,
	input en
	);
	
	assign out = en ? in : 64'bz;
	
endmodule
