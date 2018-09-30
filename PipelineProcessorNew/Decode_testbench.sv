module Decode_testbench ();

	logic clk, reset, RegWriteW, FlushE;
	logic [3:0] InFlags;
	logic [31:0] InstD, PCPlus8, ResultW, WA3W;
	logic [31:0] RD1E, RD2E, ExtImmE;
	logic PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE;
	logic [1:0] ALUControlE, FlagWriteE;
	logic [3:0] CondE, FlagsE, WA3E, ra1d, ra2d, RA1E, RA2E;


	input logic clk, reset, RegWriteW, FlushE,
	input logic [3:0] InFlags,
	input logic [31:0] InstD, PCPlus8, ResultW, 
	input logic [3:0] WA3W,
	output logic [31:0] RD1E, RD2E, ExtImmE,
	output logic PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,
	output logic [1:0] ALUControlE, FlagWriteE, 
	output logic [3:0] CondE, FlagsE, WA3E, ra1d, ra2d, RA1E, RA2E

Decode dut( clk, reset, RegWriteW, FlushE,
				InFlags,
				InstD, PCPlus8, ResultW, WA3W,
				RD1E, RD2E, ExtImmE,
				PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,
				ALUControlE, FlagWriteE,
				CondE, FlagsE, WA3E, ra1d, ra2d, RA1E, RA2E);
				
initial begin
	begin
		reset <= 1; # 10; reset <= 0;
	end
	
		RegWriteW = 1'b0; FlushE = 1'b0;
		InFlags = 4'b0;
		InstD = 32'b0; PCPlus8 = 32'd8; ResultW = 32'b0; WA3W = 32'b0;
		
		
		
	always begin
		clk <= 1; # 5; clk <= 0; # 5;
	end


end

endmodule 
	