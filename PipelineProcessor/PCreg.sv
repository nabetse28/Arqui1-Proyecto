module PCreg #	(	parameter WIDTH = 8)
					(	input logic clk, reset,
						input logic [WIDTH-1:0] inPC,
						output logic [WIDTH-1:0] outPC);
	
always_ff @(posedge clk, posedge reset)
	if (reset) outPC <= 0;
	else outPC <= inPC;
	
endmodule