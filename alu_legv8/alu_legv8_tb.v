`timescale 1ns/1ps
module alu_legv8_tb;
	reg [63:0] A, B;
	reg [4:0] FS;
	reg C0;
	wire [63:0] F;
	wire [3:0] status;
	
	alu_legv8 uut (.A(A), .B(B), .FS(FS), .C0(C0), .F(F), .status(status));
	
	initial begin
		A = 64'h168630038235f585; //1623037507341251973
		B = 64'h0619fb057171e6e0; //439658439442032352
		FS = 5'b00000; //AND 60030010031e480
		C0 = 0;
		#10
		FS = 5'b00100; //OR 169ffb07f375f7e5
		#10
		FS = 5'b01000; //ADD 1CA02B08F3A7DC65
		#10
		FS = 5'b01100; //XOR 109fcb06f3441365
		#10
		FS = 5'b10000; //LSHIFT 8235f58500000000
		#10
		FS = 5'b10100; //RSHIFT 0000000016863003
		#10
		A = 64'd6;
		B = 64'd7;
		FS = 5'b00011;
		#10 $stop;
	end
endmodule
