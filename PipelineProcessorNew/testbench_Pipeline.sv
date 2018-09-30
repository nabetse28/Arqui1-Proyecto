module testbench_Pipeline();

logic clk;
logic reset;
logic [31:0] InstrD, RD1E, RD2E, ALUResultEA, ALUResultM, ResultW,WriteDataM;

Pipeline_ARM dut(	clk, reset,
						InstrD, RD1E, RD2E, ALUResultEA, ALUResultM, ResultW,WriteDataM);

// initialize test
initial

	begin
		reset <= 1; # 10; reset <= 0;
	end
	
// generate clock to sequence tests

	always
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
	

endmodule
