module datapath_legv8(
	input [4:0] DA, SA, SB, FS,
	input W_reg, W_ram, c_out, B_sel, B_en, ram_en, alu_en, D_en, clk, rst,
	input [63:0] k,
	input [7:0] addr,
	output [3:0] stat,
	output [63:0] f,
	output [15:0] r0, r1, r2, r3, r4, r5, r6, r7
	);
	
	wire [63:0] A_bus, B_bus, D_bus, mux_alu, D_ram;
	
	regfile_32x64 regfile (A_bus, B_bus, SA, SB, W_reg, D_bus, DA, rst, clk, r0, r1, r2, r3, r4, r5, r6, r7);
	mux_2to1_64 B_mux (mux_alu, B_sel, B_bus, k);
	prog_cnt PC (clk, rst, PC_sel, PC_in, PC_out);
	tsb_64 muxbuf (B_bus, D_bus, B_en);
	alu_legv8 alu (A_bus, mux_alu, FS, c_out, f, stat);
	tsb_64 t_alu (f, D_bus, alu_en);
	tsb_64 t_ram (f, addr, ram_en);
	tsb_64 t_data (D_ram, D_bus, D_en);
	ram_256x64 ram (addr, clk, W_ram, D_bus, D_ram);
endmodule
