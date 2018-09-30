module testbench_Pipeline();

logic clk;
logic reset;
logic [31:0] InstrD, RD1E, RD2E, ALUResultEA, ALUResultM, ResultW;

Pipeline_ARM dut(	clk, reset,
						InstrD, RD1E, RD2E, ALUResultEA, ALUResultM, ResultW);

// initialize test
initial
begin
	begin
		reset <= 1; # 10; reset <= 0;
	end
	
// generate clock to sequence tests

	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end

// check that 7 gets written to address 0x64
// at end of program
/*always @(negedge clk)
	begin
		$display(ALUResult);
		if(MemWrite) begin
			if(DataAdr === 100 & WriteData === 7) begin
				$display("Simulation succeeded");
				$stop;
			end 
			else if (DataAdr !== 96) begin
				$display("Simulation failed");
				$stop;
			end
		end	
	end*/
end
endmodule
