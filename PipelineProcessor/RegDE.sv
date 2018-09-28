module RegDE (	input logic clk, clr,
					input logic [31:0] rd1, rd2, ext,
					input logic [3:0] a3, RA1D, RA2D,
					output logic [31:0] rdo1, rdo2, exto,
					output logic [3:0] ao3, RA1E, RA2E);
					

always_ff @(negedge clk) begin

	if(clr)begin
				rdo1 <= 32'b0;
				rdo2 <= 32'b0;
				exto <= 32'b0;
				ao3 <= 4'b0;
				RA1E <= 4'b0;
				RA2E <= 4'b0;
				
		end

	else 	begin
			rdo1 <= rd1;
			rdo2 <= rd2;
			exto <= ext;
			ao3 <= a3;
			RA1E <= RA1D;
			RA2E <= RA2D;
		end

end

endmodule
