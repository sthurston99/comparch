module dff_asyncrst(q, d, clk, rst, en);
	input d, clk, rst, en;
	output reg q;
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			q <= 1'b0;
		end
		else if(en) begin
			q <= d;
		end
	end
endmodule
