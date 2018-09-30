module Memory (input logic clk,
					input logic PCSrcM, RegWriteM, MemtoRegM, MemWriteM,
					input logic [31:0] ALUResultM, WriteDataM,
					input logic [3:0] WA3M,
					output logic PCSrcW, RegWriteW, MemtoRegW,
					output logic [31:0] ReadDataW, ALUOutW, ALUOutM,
					output logic [3:0] WA3W);

	logic [31:0] MemOut;
	
	MemDatos memdatos (clk, MemWriteM, ALUResultM, WriteDataM, MemOut);
	
	//registro de Mem-WB
	
	RegMW regmw(clk,
					PCSrcM, RegWriteM, MemtoRegM,
					MemOut, ALUResultM,
					WA3M,
					PCSrcW, RegWriteW, MemtoRegW,
					ReadDataW, ALUOutW,
					WA3W);
					
	assign ALUOutM = ALUResultM;

endmodule 