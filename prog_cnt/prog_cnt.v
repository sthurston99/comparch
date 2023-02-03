module prog_cnt(clk, rst, PS, in, PC);
	input clk, rst;
	// PS 00 hold, PS 01 incr, PS 10 ld, PS 11 offset
	input [1:0] PS;
	input [15:0] in;
	output [15:0] PC;
	
	wire PC_ld;
	assign PC_ld = PS[0] | PS[1];
	wire [15:0] data_in, PC_incr, PC_ost;
	
	inst_reg PC_reg (clk, rst, PC_ld, data_in, PC);
	
	assign PC_incr = PC + 1;
	assign PC_ost = PC + in;
	
	assign data_in = PS[0] ? (PS[1] ? PC_ost : PC_incr) : in;
	
endmodule
