module Decode_testbench ();

	logic clk, reset, RegWriteW, FlushE;
	logic [3:0] InFlags;
	logic [31:0] InstD, PCPlus8, ResultW, WA3W;
	logic [31:0] RD1E, RD2E, ExtImmE;
	logic PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE;
	logic [1:0] ALUControlE, FlagWriteE;
	logic [3:0] CondE, FlagsE, WA3E, ra1d, ra2d, RA1E, RA2E);


Decode dut( clk, reset, RegWriteW, FlushE,
				InFlags,
				InstD, PCPlus8, ResultW, WA3W,
				RD1E, RD2E, ExtImmE,
				PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,
				ALUControlE, FlagWriteE,
				CondE, FlagsE, WA3E, ra1d, ra2d, RA1E, RA2E);
				
initial begin
	RegWriteW = 1'b0; FlushE = 1'b0;
	InFlags = 4'b0;
	InstD = 32'b0; PCPlus8 = 32'b0; ResultW = 32'b0; WA3W = 32'b0;
	
	end
	
always begin
	clk <= 1; # 5; clk <= 0; # 5;
end

endmodule 
	