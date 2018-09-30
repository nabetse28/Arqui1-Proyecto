module Pipeline_ARM (input logic clk, reset,
							output logic [31:0] InstrD, RD1E, RD2E, ALUResultEA, ALUResultM, ResultW,WriteDataM);


logic [31:0] ReadDataW, /*WriteDataM,*/ PCPlus8, ExtImmE, ALUOutM, ALUOutW;
logic [3:0] RA1E, RA2E, ra1d, ra2d, FlagsD, CondE, FlagsE, WA3E, WA3W, WA3M;
logic [1:0] ForwardAE, ForwardBE, ALUControlE, FlagWriteE;

Fetch fetch(clk, reset,
				ResultW, ALUResultEA,
				PCSrcW, BranchTakenE, ~StallF, ~StallD, FlushD,
				InstrD, PCPlus8);

Decode decode(	clk, reset, RegWriteW, FlushE,
					FlagsD,
					InstrD, PCPlus8, ResultW, WA3W,
					RD1E, RD2E, ExtImmE,
					PCSrcD, PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,
					ALUControlE, FlagWriteE, 
					CondE, FlagsE, WA3E, ra1d, ra2d, RA1E, RA2E);

Execute execute(	clk, reset,
						RD1E, RD2E, ExtImmE, ResultW, ALUOutM,
						PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,
						ALUControlE, FlagWriteE, ForwardAE, ForwardBE,
						CondE, FlagsE, WA3E,
						PCSrcM, RegWriteM, MemWriteM, MemtoRegM, BranchTakenE,
						ALUResultM, WriteDataM, ALUResultEA,
						WA3M, FlagsD);

Memory memory(	clk,
					PCSrcM, RegWriteM, MemtoRegM, MemWriteM,
					ALUResultM, WriteDataM,
					WA3M,
					PCSrcW, RegWriteW, MemtoRegW,
					ReadDataW, ALUOutW, ALUOutM,
					WA3W); 

//Writeback

//logic [31:0] ResultW;

Mux2 # (32) mux_wb  (ALUOutW, ReadDataW, MemtoRegW, ResultW);

Hazard_Unit hazard(	RA1E, RA2E, WA3M, WA3W, ra1d, ra2d, WA3E,
							RegWriteM, RegWriteW, MemtoRegE,
							PCSrcD,PCSrcE,PCSrcM,PCSrcW, BranchTakenE,
							ForwardAE, ForwardBE,
							StallF, StallD, FlushE, FlushD);
							
											
								
endmodule
