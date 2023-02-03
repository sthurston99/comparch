module cunit(cword,k,inst,stat,clk,rst);
	output reg [30:0]cword;
	output reg [63:0]k;
	input [31:0]inst;
	input [3:0] stat;
	input clk,rst;
	
	wire [10:0] op11 = inst[31:21];
	wire  [9:0] op10 = inst[31:22];
	wire  [8:0] op9 = inst[31:23];
	wire  [7:0] op8 = inst[31:24];
	wire  [5:0] op6 = inst[31:26];
	wire [4:0] zero = 5'b11111, link = 5'b11110, scratch = 5'b11101;
	reg[1:0] state = 2'b00;
	reg[5:0] statreg;
	
	always @ (posedge clk) begin
		statreg <= cword[0] ? {stat, stat[0]} : {statreg[5:1], stat[0]};
		if(state == 2'b00) begin
			case(op11)
				11'b10001011000: cword <= {inst[4:0],inst[9:5],inst[20:16],2'b01,5'b01000,1'bX,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0}; //ADD
				11'b11001011000: cword <= {inst[4:0],inst[9:5],inst[20:16],2'b01,5'b01001,1'bX,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0}; //SUB
				11'b10101011000: cword <= {inst[4:0],inst[9:5],inst[20:16],2'b01,5'b01000,1'bX,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}; //ADDS
				11'b11101011000: cword <= {inst[4:0],inst[9:5],inst[20:16],2'b01,5'b01001,1'bX,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}; //SUBS
				11'b11111000000: {cword,k} <= {5'bX,inst[9:5],inst[4:0],2'b01,5'b01000,1'bX,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,{55'b0,inst[20:12]}}; //STUR reg
				11'b11111000010: {cword,k} <= {inst[4:0],inst[9:5],5'bX,2'b01,5'b01000,1'bX,1'b1,1'b0,1'b1,1'b0,1'b0,1'b0,1'b1,1'b0,{55'b0,inst[20:12]}}; //LDUR reg
				11'b10111000000: {state,cword,k} <= {2'b01,scratch,inst[9:5],5'bX,2'b00,5'b00100,1'bX,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,{32'b0,32'hFFFFFFFF}}; //STUR wrd
				11'b10111000010: {state,cword,k} <= {2'b01,scratch,inst[9:5],5'bX,2'b00,5'b01000,1'bX,1'b1,1'b0,1'b1,1'b0,1'b0,1'b0,1'b1,1'b0,{(inst[20] ? {3'b111, 52'hFFFFFFFFFFFFF} : 55'b0),inst[20:12]}}; //LDUR wrd
				11'b01111000000: {state,cword,k} <= {2'b01,scratch,inst[9:5],5'bX,2'b00,5'b00100,1'bX,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,{48'b0,16'hFFFF}}; //STURH
				11'b01111000010: {state,cword,k} <= {2'b01,scratch,inst[9:5],5'bX,2'b00,5'b01000,1'bX,1'b1,1'b0,1'b1,1'b0,1'b0,1'b0,1'b1,1'b0,{(inst[20] ? {3'b111, 52'hFFFFFFFFFFFFF} : 55'b0),inst[20:12]}}; //LDURH
				11'b00111000000: {state,cword,k} <= {2'b01,scratch,inst[9:5],5'bX,2'b00,5'b00100,1'bX,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,{56'b0,8'hFF}}; //STURB
				11'b00111000010: {state,cword,k} <= {2'b01,scratch,inst[9:5],5'bX,2'b00,5'b01000,1'bX,1'b1,1'b0,1'b1,1'b0,1'b0,1'b0,1'b1,1'b0,{(inst[20] ? {3'b111, 52'hFFFFFFFFFFFFF} : 55'b0),inst[20:12]}}; //LDURB
				11'b10001010000: cword <= {inst[4:0],inst[9:5],inst[20:16],2'b01,5'b00000,1'bX,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0}; //AND
				11'b10101010000: cword <= {inst[4:0],inst[9:5],inst[20:16],2'b01,5'b00100,1'bX,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0}; //ORR
				11'b11001010000: cword <= {inst[4:0],inst[9:5],inst[20:16],2'b01,5'b01100,1'bX,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0}; //EOR
				11'b11101010000: cword <= {inst[4:0],inst[9:5],inst[20:16],2'b01,5'b00000,1'bX,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}; //ANDS
				11'b11010011010: cword <= {inst[4:0],inst[9:5],       5'bX,2'b01,5'b10100,1'bX,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0}; //LSR
				11'b11010011011: cword <= {inst[4:0],inst[9:5],       5'bX,2'b01,5'b10000,1'bX,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0}; //LSL
				11'b11010110000: {state,cword} <= {2'b01,5'bX,inst[4:0],5'bX,2'b10,  5'bX,1'b0,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx}; //BR
			endcase
			case(op10)
				10'b1001000100: {cword,k} <= {inst[4:0],inst[9:5],5'bX,2'b01,5'b01000,1'bX,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,{52'b0,inst[21:10]}}; //ADDI
				10'b1101000100: {cword,k} <= {inst[4:0],inst[9:5],5'bX,2'b01,5'b01001,1'bX,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,{52'b0,inst[21:10]}}; //SUBI
				10'b1011000100: {cword,k} <= {inst[4:0],inst[9:5],5'bX,2'b01,5'b01000,1'bX,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,{52'b0,inst[21:10]}}; //ADDIS
				10'b1111000100: {cword,k} <= {inst[4:0],inst[9:5],5'bX,2'b01,5'b01001,1'bX,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,{52'b0,inst[21:10]}}; //SUBIS
				10'b1001001000: {cword,k} <= {inst[4:0],inst[9:5],5'bX,2'b01,5'b00000,1'bX,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,{52'b0,inst[21:10]}}; //ANDI
				10'b1011001000: {cword,k} <= {inst[4:0],inst[9:5],5'bX,2'b01,5'b00100,1'bX,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,{52'b0,inst[21:10]}}; //ORRI
				10'b1101001000: {cword,k} <= {inst[4:0],inst[9:5],5'bX,2'b01,5'b01100,1'bX,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,{52'b0,inst[21:10]}}; //EORI
				10'b1111001000: {cword,k} <= {inst[4:0],inst[9:5],5'bX,2'b01,5'b00000,1'bX,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,{52'b0,inst[21:10]}}; //ANDIS
			endcase
			case(op9)
				9'b110100101:; //MOVZ
				9'b111100101:; //MOVK
			endcase
			case(op8)
				8'b10110100: {state,cword} <= {2'b01,5'bx,inst[4:0],zero,2'b00,5'b01000,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'b1}; //CBZ
				8'b10110101: {state,cword} <= {2'b01,5'bx,inst[4:0],zero,2'b00,5'b01000,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'b1}; //CBNZ
				8'b01010100:; //B.cond
			endcase
			case(op6)
				6'b000101: {state,cword,k} <= {2'b01,5'bx,5'bx,5'bx,2'b10,5'bx,1'b1,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,{38'b0,inst[25:0]}}; //B
				6'b100101: {state,cword,k} <= {2'b01,link,zero,5'bX,2'b10,5'b00100,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b1,1'bX,{38'b0,inst[25:0]}}; //BL
			endcase
		end else if(state == 2'b01) begin
			case(op11)
				11'b10111000000: {state,cword,k} <= {2'b00,5'bX,scratch,inst[4:0],2'b01,5'b01000,1'bX,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,{(inst[20] ? {3'b111, 52'hFFFFFFFFFFFFF} : 55'b0),inst[20:12]}}; //STUR wrd
				11'b10111000010: {state,cword,k} <= {2'b00,inst[4:0],scratch,5'bX,2'b01,5'b00100,1'bX,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,{32'b0,32'hFFFFFFFF}}; //LDUR wrd
				11'b01111000000: {state,cword,k} <= {2'b00,5'bX,scratch,inst[4:0],2'b01,5'b01000,1'bX,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,{(inst[20] ? {3'b111, 52'hFFFFFFFFFFFFF} : 55'b0),inst[20:12]}}; //STURH
				11'b01111000010: {state,cword,k} <= {2'b00,inst[4:0],scratch,5'bX,2'b01,5'b00100,1'bX,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,{48'b0,16'hFFFF}}; //LDURH
				11'b00111000000: {state,cword,k} <= {2'b00,5'bX,scratch,inst[4:0],2'b01,5'b01000,1'bX,1'b1,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,{(inst[20] ? {3'b111, 52'hFFFFFFFFFFFFF} : 55'b0),inst[20:12]}}; //STURB
				11'b00111000010: {state,cword,k} <= {2'b00,inst[4:0],scratch,5'bX,2'b01,5'b00100,1'bX,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,{56'b0,8'hFF}}; //LDURB
				11'b11010110000: {state,cword} <= {2'b00,5'bX,5'bX,5'bX,2'b01,5'bX,1'bX,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx,1'bx}; //BR
			endcase
			case(op9)
				9'b111100101:; //MOVK
			endcase
			case(op8)
				8'b10110100: {state,cword,k} <= ~statreg[0] ? {2'b10,5'bx,5'bx,5'bx,2'b10,5'bx,1'b1,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,{45'b0,inst[23:5]}} : {2'b10,31'bX,64'bX}; //CBZ
				8'b10110101: {state,cword,k} <= statreg [0] ? {2'b10,5'bx,5'bx,5'bx,2'b10,5'bx,1'b1,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,{45'b0,inst[23:5]}} : {2'b10,31'bX,64'bX}; //CBNZ
				8'b01010100:; //B.cond
			endcase
			case(op6)
				6'b000101: {state,cword} <= {2'b00,5'bx,5'bx,5'bx,2'b01,5'bx,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX}; //B
				6'b100101: {state,cword} <= {2'b00,5'bx,5'bx,5'bx,2'b01,5'bx,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX}; //BL
			endcase
		end else if(state == 2'b10) begin
			case(op8)
				8'b10110100: {state,cword} <= {2'b00,5'bx,5'bx,5'bx,2'b01,5'bx,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX}; //CBZ
				8'b10110101: {state,cword} <= {2'b00,5'bx,5'bx,5'bx,2'b01,5'bx,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX,1'bX}; //CBNZ
			endcase
		end else begin
		end
	end
endmodule
