module decoder_4to16(o, i);
	input [3:0] i;
	output [15:0] o;
	wire[3:0] i_inv;
	
	not inv0  (i_inv[0], i[0]);
	not inv1  (i_inv[1], i[1]);
	not inv2  (i_inv[2], i[2]);
	not inv3  (i_inv[3], i[3]);
	and out0  ( o[0], i_inv[3], i_inv[2], i_inv[1], i_inv[0]);
	and out1  ( o[1], i_inv[3], i_inv[2], i_inv[1],     i[0]);
	and out2  ( o[2], i_inv[3], i_inv[2],     i[1], i_inv[0]);
	and out3  ( o[3], i_inv[3], i_inv[2],     i[1],     i[0]);
	and out4  ( o[4], i_inv[3],     i[2], i_inv[1], i_inv[0]);
	and out5  ( o[5], i_inv[3],     i[2], i_inv[1],     i[0]);
	and out6  ( o[6], i_inv[3],     i[2],     i[1], i_inv[0]);
	and out7  ( o[7], i_inv[3],     i[2],     i[1],     i[0]);
	and out8  ( o[8],     i[3], i_inv[2], i_inv[1], i_inv[0]);
	and out9  ( o[9],     i[3], i_inv[2], i_inv[1],     i[0]);
	and out10 (o[10],     i[3], i_inv[2],     i[1], i_inv[0]);
	and out11 (o[11],     i[3], i_inv[2],     i[1],     i[0]);
	and out12 (o[12],     i[3],     i[2], i_inv[1], i_inv[0]);
	and out13 (o[13],     i[3],     i[2], i_inv[1],     i[0]);
	and out14 (o[14],     i[3],     i[2],     i[1], i_inv[0]);
	and out15 (o[15],     i[3],     i[2],     i[1],     i[0]);
	
endmodule
