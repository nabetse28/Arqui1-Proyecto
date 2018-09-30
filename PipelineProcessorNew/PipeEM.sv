module PipeEM (input logic clk,
					input logic in1,in2,in3,in4,
					output logic PCSrcM,RegWriteM,MemtoRegM,MemWriteM);
					
always_ff @(negedge clk)
	begin
		PCSrcM = in1;
		RegWriteM = in2;
		MemtoRegM = in3;
		MemWriteM = in4;
	end
	
endmodule
