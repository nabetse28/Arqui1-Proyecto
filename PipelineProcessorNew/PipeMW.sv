module PipeMW (input logic clk,
					input logic PCSrcM,RegWriteM,MemtoRegM,
					output logic PCSrcW,RegWriteW,MemtoRegW);
					
					
always_ff @(negedge clk)
	begin
		PCSrcW = PCSrcM;
		RegWriteW = RegWriteM;
		MemtoRegW = MemtoRegM;
	end
endmodule
	