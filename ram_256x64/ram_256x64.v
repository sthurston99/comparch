module ram_256x64(
	input [7:0] addr,
	input clk, W_en,
	input [63:0] in,
	output reg [63:0] out
	);
	
	reg [63:0] mem [0:255];
	
	always @(posedge clk) begin
		if(W_en) begin
			mem[addr] <= in;
		end
	end
	
	always @(posedge clk) begin
		out <= mem[addr];
	end
endmodule
