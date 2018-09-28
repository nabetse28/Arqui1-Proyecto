module Pipeline_ARM (input logic CLK_50, reset,
							output logic [31:0] ALUResult);




logic [1:0] RegSrcD, ImmSrcD;
logic RegWriteW, MemtoRegW,PCSrcW,ALUSrcE, MemWriteM;
logic MemtoRegE,RegWriteM,BranchTakenE;
logic [1:0] ALUControlE;

PasoControl pasocontrol(.clk(CLK_50),.FlushE(FlushE),.reset(reset),
								.Op(Opcode),
								.Rd(Rd), .CondD(CondD),
								.Funct(Funct),
								.ALUFlags(AluFlags),
								.RegSrcD(RegSrcD), .ImmSrcD(ImmSrcD),
								.RegWriteW(RegWriteW), .MemtoRegW(MemtoRegW),.PCSrcW(PCSrcW),.ALUSrcE(ALUSrcE), .MemWriteM(MemWriteM),
								.MemtoRegE(MemtoRegE),.RegWriteM(RegWriteM),.BranchTakenE(BranchTakenE),
								.ALUControlE(ALUControlE));


logic [3:0] AluFlags;
logic [1:0] Opcode;
logic [3:0] Rd, CondD, RA1E, RA2E, ra1d, ra2d;
logic [5:0] Funct;
logic [3:0] WA3W, WA3E, WA3M;

PasoDatos pasodatos(.clk(CLK_50), .reset(reset),
							.PCSrcW(PCSrcW), .BranchTakenE(BranchTakenE), .StallF(StallF), .StallD(StallD), .FlushD(FlushD),
							.RegSrcD(RegSrcD), .ImmSrcD(ImmSrcD),
							.RegWriteW(RegWriteW),
							.FlushE(FlusE), .ALUSrcE(ALUSrcE),
							.ForwardAE(ForwardAE), .ForwardBE(ForwardBE), .AluControlE(ALUControlE),
							.MemWriteM(MemWriteM), .MemtoRegW(MemtoRegW),
							.AluFlags(AluFlags),
							.Opcode(Opcode),
							.Rd(Rd), .CondD(CondD), .RA1E(RA1E), .RA2E(RA2E), .ra1d(ra1d), .ra2d(ra2d),
							.Funct(Funct),
							.WA3W(WA3W), .WA3E(WA3E), .WA3M(WA3M),
							.ALUResult(ALUResult));

logic [1:0] ForwardAE;
logic [1:0] ForwardBE;
logic StallF,StallD,FlushE;

Hazard_Unit hazard_unit(.RA1E(RA1E),
								.RA2E(RA2E),
								.WA3M(WA3M),
								.WA3W(WA3W),
								.RA1D(ra1d),
								.RA2D(ra2d),
								.WA3E(WA3E),
								.RegWriteM(RegWriteM),
								.RegWriteW(RegWriteW),
								.MemtoRegE(MemtoRegE),
								.ForwardAE(ForwardAE),
								.ForwardBE(ForwardBE),
								.StallF(StallF), .StallD(StallD), .FlushE(FlushE));
								
								
				endmodule
