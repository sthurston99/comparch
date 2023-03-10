module alu_legv8(A, B, FS, C0, F, status);
	input [63:0] A, B;
	input [4:0] FS;
	input C0;
	output [63:0] F;
	output [3:0] status; //Z, N, C, V
	
	wire Z, N, C, V;
	
	assign status = {V, C, N, Z};
	
	wire [63:0] A_sig, B_sig;
	assign A_sig = FS[1] ? ~A : A;
	assign B_sig = FS[0] ? ~B : B;
	
	assign N = F[63];
	assign Z = (F == 64'b0) ? 1'b1 : 1'b0;
	assign V = ~(A_sig[63] ^ B_sig[63]) & (F[63] ^ A_sig[63]);
	
	wire [63:0] and_o, or_o, xor_o, add_o, lshift, rshift;
	
	assign and_o = A_sig & B_sig;
	assign or_o = A_sig | B_sig;
	assign xor_o = A_sig ^ B_sig;
	
	adder_64 adder (A_sig, B_sig, C0, add_o, C);
	
	shifter_64 shifter (A, B[5:0], lshift, rshift);
	
	mux_8to1_64 mux (F, FS[4:2], and_o, or_o, add_o, xor_o, lshift, rshift, 64'b0, 64'b0);
	
endmodule
