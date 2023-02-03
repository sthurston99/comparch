`timescale 1ns/1ps
module reg_64_tb;
	wire [63:0] q;
	reg [63:0] d;
	reg en, rst, clk;
	
	reg_64 uut (.q(q), .d(d), .en(en), .rst(rst), .clk(clk));
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		d = 64'b0;
		en = 1'b0;
		rst = 1'b0;
		
		#10 en = 1'b1;
		#10 d = 64'b1;
		#10 en = 1'b0;
		d = 64'b10;
		#10 rst = 1'b1;
		#10 rst = 1'b0;
		#10 $stop;
	end
endmodule
