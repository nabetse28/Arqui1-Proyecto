module PasoDatos  (	input logic clk, reset,
							input logic PCSrcW, BranchTakenE, StallF, StallD, FlushD,
							input logic [1:0] RegSrcD, ImmSrcD,
							input logic RegWriteW,
							input logic FlushE, ALUSrcE,
							input logic [1:0] ForwardAE, ForwardBE, AluControlE,
							input logic MemWriteM, MemtoRegW,
							output logic [3:0] AluFlags);
	
	//Seccion de Fetch
	
	logic [31:0] PCPlus4, ResultW, PCJump, ALUResultE, PCNext, PCout;
		
	Mux2 #(32) mux_pc4 (PCPlus4, ResultW, PCSrcW, PCJump);
	
	Mux2 # (32) mux_pcnext (PCJump, ALUResultE, BranchTakenE, PCNext);
	
	PCreg # (32) PC (clk, StallF, PCNext, PCout);
	
	assign PCPlus4 = PCout + 4;
	
	MemInst MI (PCout, InstOut);
	
	logic [31:0] regF;
	
	//Registro de Fetch-Deco
	RegFD regfd (clk, StallD, FlushD, InstOut, regF);
	
	//Seccion de Deco
	
	logic [31:0] InstD, RA1D, RA2D, RD1, RD2, ExtOut;
	logic [3:0] WA3W;
	
	assign InstD = regF;
	
	Mux2 # (4) mux_ra1 (InstD[19:16], 4'b1111, RegSrcD[0], RA1D);
	Mux2 # (4) mux_ra2 (InstD[3:0], InstD[15:12], RegSrcD[1], RA2D);
	
	BancoRegistros BR (clk, RegWriteW, reset, RA1D, RA2D, WA3W, ResultW, (PCPlus4 + 4), RD1, RD2);
	
	Extend extend (InstD[23:0], ImmSrcD, ExtOut);
	
	//registro de Deco-Exe
	
	logic [31:0] RDE1, RDE2, ExtE, ALUOutM, Op1, Op2, WriteDataE;
	logic [3:0] A3E;
	
	RegDE regde (clk, FlushE, RD1, RD2, ExtOut, InstD[15:12], RDE1, RDE2, ExtE, A3E);
	
	//Seccion de Exe
	
	Mux3 # (32) mux_ra1E (RDE1, ResultW, ALUOutM, ForwardAE, Op1);
	Mux3 # (32) mux_ra2E (RDE2, ResultW, ALUOutM, ForwardBE, WriteDataE);
	Mux2 # (32) mux_op2  (WriteDataE, ExtE, ALUSrcE, Op2);
	
	ALU # (32) alu (Op1, Op2, AluControlE, AluFlags, ALUResultE);
	
	//registro de Exe-Mem
	logic [31:0] WDMem;
	logic [3:0] A3M;
	
	RegEM regem (clk, ALUResultE, WriteDataE, A3E, ALUOutM, WDMem, A3M);
	
	//Seccion de Mem
	
	logic [31:0] MemOut;
	
	MemDatos memdatos (clk, MemWriteM, ALUOutM, WDMem, MemOut);
	
	//registro de Mem-WB
	
	logic [31:0] ReadDataW, ALUOutW;
	
	RegMW regmw (clk, MemOut, ALUOutM, A3M, ReadDataW, ALUOutW, WA3W);

	Mux2 # (32) mux_wb (ReadDataW, ALUOutW, MemtoRegW, ResultW);
	
	
endmodule
