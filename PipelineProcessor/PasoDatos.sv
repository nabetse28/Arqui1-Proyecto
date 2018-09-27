module PasoDatos  (	input logic clk,
							input logic PCSrcW, BranchTakenE, StallF, StallD, FlushD,
							input logic RegSrcD
							);
	
	//Seccion de Fetch
	
	logic [31:0] PCPlus4, ResultW, PCJump, ALUResultE, PCNext, PCout;
		
	Mux2 #(32) mux_pc4 (PCPlus4, ResultW, PCSrcW, PCJump);
	
	Mux2 # (32) mux_pcnext (PCJump, ALUResultE, BranchTakenE, PCNext);
	
	PCreg # (32) PC (clk, StallF, PCNext, PCout);
	
	assign PCPlus4 = PCout + 4;
	
	MemInst MI (PCout, InstOut);
	
	logic [31:0] regF;
	
	//Registro de Fetch-Deco
	always_ff @(posedge clk) begin
	
	if(FlushD)begin
				regF <= 32'b0;
	end

	else if (StallD) regF <= InstOut;

	end
	
	//Seccion de Deco
	
	logic [31:0] InstD, RA1D, RA2D;
	
	assign InstD = regF;
	
	Mux2 # (4) mux_ra1 ([19:16]InstD, 4'b1111, ~RegSrcD, RA1D)
	
	Mux2 # (4) mux_ra1 ([3:0]InstD, [15:12]InstD, RegSrcD, RA2D)
	
	
endmodule
