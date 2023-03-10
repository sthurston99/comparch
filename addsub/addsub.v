module addsub(o, a, b, s, clk);
	input [7:0] a, b;
	input s, clk;
	output reg [8:0] o;
	
	always @(posedge clk) begin
		if(s) o <= a + b;
		else o <= a - b;
	end
endmodule
