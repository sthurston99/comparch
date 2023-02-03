`timescale 1ns/1ps
module datapath_legv8_tb;
	reg [4:0] DA, SA, SB, FS;
	reg W_reg, W_ram, c_out, B_sel, B_en, ram_en, alu_en, D_en, clk, rst;
	reg [63:0] k;
	reg [7:0] addr;
	wire [3:0] stat;
	wire [63:0] f;
	wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7;

	datapath_legv8 uut(
	.DA(DA),
	.SA(SA),
	.SB(SB),
	.FS(FS),
	.W_reg(W_reg),
	.W_ram(W_ram),
	.c_out(c_out),
	.B_sel(B_sel),
	.B_en(B_en),
	.ram_en(ram_en),
	.alu_en(alu_en),
	.D_en(D_en),
	.clk(clk),
	.rst(rst),
	.k(k),
	.addr(addr),
	.stat(stat),
	.f(f),
	.r0(r0),
	.r1(r1),
	.r2(r2),
	.r3(r3),
	.r4(r4),
	.r5(r5),
	.r6(r6),
	.r7(r7)
	);
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	integer i;
	
	initial begin
		c_out = 1'b0;
		rst = 1'b0;
		SA = 5'd31;
		k = 1'd1;
		FS = 5'b01000;
		B_sel = 1'b1;
		alu_en = 1'b1;
		W_ram = 1'b1;
		ram_en = 1'b0;
		addr = 8'b0;
		B_en = 1'b0;
		D_en = 1'b0;
		#20
		W_ram = 1'b0;
		B_sel = 1'b0;
		D_en = 1'b1;
		alu_en = 1'b0;
		W_reg = 1'b1;
		SB = 5'b0;
		assign DA = SB;
		#10
		SA = 5'b1;
		assign DA = SA;
		D_en = 1'b0;
		alu_en = 1'b10;	
		#10
		for(i=0; i<10; i=i+1) begin
			assign DA = SA;
			#10
			assign DA = SB;
			#10
			;
		end
		$stop;
	end
	
	
endmodule
