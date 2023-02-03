module reg_64(q, d, en, rst, clk);
	output reg [63:0] q;
	input [63:0] d;
	input en, rst, clk;
	
	always @(posedge clk or posedge rst) begin
		if(rst) q <= 0;
		else if(en) q <= d;
		else q <= q;
	end
endmodule
	