`timescale 1ns/1ps
module dff_asyncrst_tb;
	reg d, clk, rst, en;
	wire q;
	
	dff_asyncrst uut (.q(q), .d(d), .clk(clk), .rst(rst), .en(en));
	
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		#10
			en = 1'b0;
			d = 1'b0;
			rst = 1'b0;
		#10 d = 1'b1;
		#10
			en = 1'b1;
			d = 1'b0;
		#10 d = 1'b1;
		#10
			en = 1'b0;
			d = 1'b0;
		#10 rst = 1'b1;
		#10 $stop;
	end
endmodule
