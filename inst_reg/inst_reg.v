module inst_reg (clk, rst, ld, in, out);
	input clk, rst, ld;
	
	parameter n = 16;
	input [n-1:0] in;
	output reg [n-1:0] out;
	
	initial begin
		out <= 16'b0;
	end
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			out <= 16'b0;
		end
		else begin
			if(ld) out <= in;
		end
	end
endmodule
