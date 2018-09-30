module Execute (	input logic clk, reset,
						input logic [31:0] RD1E, RD2E, ExtImmE, ResultW, ALUResultMFB,
						input logic PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,
						input logic [1:0] ALUControlE, FlagWriteE, ForwardAE, ForwardBE,
						input logic [3:0] CondE, FlagsE, WA3E,
						output logic PCSrcM, RegWriteM, MemWriteM, MemtoRegM, BranchTakenE,
						output logic [31:0] ALUResultM, WriteDataM,
						output [3:0] WA3M, FlagsD);

	logic [31:0] WriteDataE, Op1, Op2, ALUResultE;
	
	Mux3 # (32) mux_ra1E (RD1E, ResultW, ALUResultMFB, ForwardAE, Op1);
	Mux3 # (32) mux_ra2E (RD2E, ResultW, ALUResultMFB, ForwardBE, WriteDataE);
	Mux2 # (32) mux_op2  (WriteDataE, ExtImmE, ALUSrcE, Op2);
	
	logic [1:0] ALUFlags;
	
	ALU # (32) alu (Op1, Op2, ALUControlE, ALUFlags, ALUResultE);
	
	logic PCSrcEA, RegWriteEA, MemWriteEA;
	
	Condition_Unit condUnit (clk, reset,
									 CondE,
									 ALUFlags,
									 FlagsE,
									 FlagsD,
									 FlagWriteE,
									 PCSrcE, RegWriteE, MemWriteE,BranchE,
									 PCSrcEA, RegWriteEA,MemWriteEA, BranchTakenE);
	
	RegEM regem(clk,
					PCSrcEA, RegWriteEA, MemWriteEA, MemtoRegE,
					ALUResultE, WriteDataE,
					WA3E,
					PCSrcM, RegWriteM, MemWriteM, MemtoRegM,
					ALUResultM, WriteDataM,
					WA3M);


endmodule 