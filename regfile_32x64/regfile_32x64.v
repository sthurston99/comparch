module regfile_32x64(
	output [63:0] rdA,
	output [63:0] rdB,
	input [4:0] raA,
	input [4:0] raB,
	input w,
	input [63:0] wd,
	input [4:0] wa,
	input rst,
	input clk,
	output [15:0] test0,
	output [15:0] test1,
	output [15:0] test2,
	output [15:0] test3,
	output [15:0] test4,
	output [15:0] test5,
	output [15:0] test6,
	output [15:0] test7);
	
	wire [31:0] a;
	wire [31:0] en;
	decoder_5to32 as (a, wa);
	assign en = a & {32{w}};
	
	wire [63:0] o00, o01, o02, o03, o04, o05, o06, o07;
	wire [63:0] o08, o09, o10, o11, o12, o13, o14, o15;
	wire [63:0] o16, o17, o18, o19, o20, o21, o22, o23;
	wire [63:0] o24, o25, o26, o27, o28, o29, o30, o31;
	
	reg_64 r00 (o00, wd, en[0], rst, clk);
	reg_64 r01 (o01, wd, en[1], rst, clk);
	reg_64 r02 (o02, wd, en[2], rst, clk);
	reg_64 r03 (o03, wd, en[3], rst, clk);
	reg_64 r04 (o04, wd, en[4], rst, clk);
	reg_64 r05 (o05, wd, en[5], rst, clk);
	reg_64 r06 (o06, wd, en[6], rst, clk);
	reg_64 r07 (o07, wd, en[7], rst, clk);
	reg_64 r08 (o08, wd, en[8], rst, clk);
	reg_64 r09 (o09, wd, en[9], rst, clk);
	reg_64 r10 (o10, wd, en[10], rst, clk);
	reg_64 r11 (o11, wd, en[11], rst, clk);
	reg_64 r12 (o12, wd, en[12], rst, clk);
	reg_64 r13 (o13, wd, en[13], rst, clk);
	reg_64 r14 (o14, wd, en[14], rst, clk);
	reg_64 r15 (o15, wd, en[15], rst, clk);
	reg_64 r16 (o16, wd, en[16], rst, clk);
	reg_64 r17 (o17, wd, en[17], rst, clk);
	reg_64 r18 (o18, wd, en[18], rst, clk);
	reg_64 r19 (o19, wd, en[19], rst, clk);
	reg_64 r20 (o20, wd, en[20], rst, clk);
	reg_64 r21 (o21, wd, en[21], rst, clk);
	reg_64 r22 (o22, wd, en[22], rst, clk);
	reg_64 r23 (o23, wd, en[23], rst, clk);
	reg_64 r24 (o24, wd, en[24], rst, clk);
	reg_64 r25 (o25, wd, en[25], rst, clk);
	reg_64 r26 (o26, wd, en[26], rst, clk);
	reg_64 r27 (o27, wd, en[27], rst, clk);
	reg_64 r28 (o28, wd, en[28], rst, clk);
	reg_64 r29 (o29, wd, en[29], rst, clk);
	reg_64 r30 (o30, wd, en[30], rst, clk);
	assign o31 = 64'b0;
	
	mux_32to1_64 mA (rdA, raA, o00, o01, o02, o03, o04, o05, o06, o07,
										o08, o09, o10, o11, o12, o13, o14, o15,
										o16, o17, o18, o19, o20, o21, o22, o23,
										o24, o25, o26, o27, o28, o29, o30, o31);
										
	mux_32to1_64 mB (rdB, raB, o00, o01, o02, o03, o04, o05, o06, o07,
										o08, o09, o10, o11, o12, o13, o14, o15,
										o16, o17, o18, o19, o20, o21, o22, o23,
										o24, o25, o26, o27, o28, o29, o30, o31);
	
	assign test0 = o00[15:0];
	assign test1 = o01[15:0];
	assign test2 = o02[15:0];
	assign test3 = o03[15:0];
	assign test4 = o04[15:0];
	assign test5 = o05[15:0];
	assign test6 = o06[15:0];
	assign test7 = o07[15:0];
	
endmodule
