module RegMW (	input logic clk,
					input logic [31:0] memr, aluout,
					input logic [3:0] a3,
					output logic [31:0] memro, aluouto,
					output logic [3:0] ao3);
					

always_ff @(negedge clk) begin

		memro <= memr;
		aluouto <= aluout;
		ao3 <= a3;


end

endmodule