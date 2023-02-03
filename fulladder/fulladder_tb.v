`timescale 1ns/1ps
module fulladder_tb;
	reg a, b, cin;
	wire o, cout;
	
	fulladder uut (.o(o), .cout(cout), .a(a), .b(b), .cin(cin));
	
	initial begin
		#10
			a = 1'b0;
			b = 1'b0;
			cin = 1'b0;
		#10 a = 1'b1;
		#10 b = 1'b1;
		#10 a = 1'b0;
		#10 cin = 1'b1;
		#10 b = 1'b0;
		#10 a = 1'b1;
		#10 b = 1'b1;
		#10 $stop;
	end
endmodule
