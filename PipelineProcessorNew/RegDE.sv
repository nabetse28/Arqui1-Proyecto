module RegDE (	input logic clk, clr,reset,
					input logic PCSrcD, RegWriteD, MemtoRegD, MemWriteD, BranchD, ALUSrcD,
					input logic [1:0] ALUControlD, FlagWriteD, 
					input logic [3:0] CondD, FlagsD,
					input logic [31:0] rd1, rd2, ext,
					input logic [3:0] a3, RA1D, RA2D,
					output logic [31:0] rdo1, rdo2, exto,
					output logic [3:0] ao3, RA1E, RA2E,
					output logic PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,
					output logic [1:0] ALUControlE, FlagWriteE, 
					output logic [3:0] CondE, FlagsE);
					

always_ff @(posedge clk) begin

	if(clr || reset)begin
				rdo1 <= 32'b0;
				rdo2 <= 32'b0;
				exto <= 32'b0;
				ao3 <= 4'b0;
				RA1E <= 4'b0;
				RA2E <= 4'b0;
				PCSrcE <= 1'b0;
				RegWriteE <= 1'b0;
				MemtoRegE <= 1'b0;
				MemWriteE <= 1'b0;
				BranchE <= 1'b0;
				ALUSrcE <= 1'b0;
				ALUControlE <= 2'b0;
				FlagWriteE <= 2'b0;
				CondE <= 4'b0;
				FlagsE <= 4'b0;
				
		end

	else 	begin
			rdo1 <= rd1;
			rdo2 <= rd2;
			exto <= ext;
			ao3 <= a3;
			RA1E <= RA1D;
			RA2E <= RA2D;
			PCSrcE <= PCSrcD;
			RegWriteE <= RegWriteD;
			MemtoRegE <= MemtoRegD;
			MemWriteE <= MemWriteD;
			BranchE <= BranchD;
			ALUSrcE <= ALUSrcD;
			ALUControlE <= ALUControlD;
			FlagWriteE <= FlagWriteD;
			CondE <= CondD;
			FlagsE <= FlagsD;
		end

end

endmodule
