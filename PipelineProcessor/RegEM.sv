module RegEM (	input logic clk,
					input logic [31:0] aluR, writeD,
					input logic [3:0] a3,
					output logic [31:0] aluRo, writeDo,
					output logic [3:0] ao3);
					

always_ff @(posedge clk) begin

		aluRo <= aluR;
		writeDo <= writeD;
		ao3 <= a3;


end

endmodule