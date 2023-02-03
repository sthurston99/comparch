module mux_4to1_strctrl(o, i, s);
	input [3:0] i;
	input [1:0] s;
	output o;
	
	wire ns0, ns1;
	wire y0, y1, y2, y3;
	
	not n0(ns0, s[0]);
	not n1(ns1, s[1]);
	and a0(y0, i[0], ns1, ns0);
	and a1(y1, i[1], ns1, s[0]);
	and a2(y2, i[2], s[1], ns0);
	and a3(y3, i[3], s[1], s[0]);
	or o0(o, y3, y2, y1, y0);
endmodule
