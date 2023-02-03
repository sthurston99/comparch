module fulladder(o, cout, a, b, cin);
	input a, b, cin;
	output o, cout;
	
	assign
		o = ((a ^ b) ^ cin),
		cout = ((a & b) | ((a ^ b) & cin));
		
endmodule
