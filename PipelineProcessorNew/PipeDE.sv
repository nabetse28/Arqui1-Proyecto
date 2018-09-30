module PipeDE (input logic clk,Clear,
					input logic PCSrcD,RegWriteD,MemtoRegD,
					input logic MemWriteD,BranchD,ALUSrcD,
					input logic [1:0] ALUControlD,FlagWriteD,
					input logic [3:0] FlagIn,CondD,
					
					output logic PCSrcE,RegWriteE,MemtoRegE,
					output logic MemWriteE,BranchE,ALUSrcE,
					output logic [1:0] ALUControlE,FlagWriteE,
					output logic [3:0] FlagsE,CondE
					);
					
					
always_ff @(negedge clk)
	begin
		
		
		PCSrcE = PCSrcD;
		RegWriteE = RegWriteD;
		MemtoRegE = MemtoRegD;
		MemWriteE = MemWriteD;
		BranchE = BranchD;
		ALUSrcE = ALUSrcD;
		ALUControlE = ALUControlD;
		FlagWriteE = FlagWriteD;
		FlagsE = FlagIn;
		CondE = CondE;
		
		if(Clear)
		begin
			PCSrcE = 1'd0;
			RegWriteE = 1'd0;
			MemtoRegE = 1'd0;
			MemWriteE = 1'd0;
			BranchE = 1'd0;
			ALUSrcE = 1'd0;
			ALUControlE = 2'd0;
			FlagWriteE = 2'd0;
			FlagsE = 4'd0;
			CondE = 4'd0;
		end
		
		
	end
	
endmodule
