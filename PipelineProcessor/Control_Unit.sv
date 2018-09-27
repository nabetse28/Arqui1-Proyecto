module Control_Unit(input logic [1:0] Op,
						  input logic [5:0] Funct,
						  input logic [3:0] Rd,
						  output logic [1:0] FlagWriteD,
						  output logic PCSrcD, RegWriteD,MemtoRegD,
						  output logic MemWriteD, BranchD,ALUSrcD,
						  output logic [1:0] ALUControlD,ImmSrcD,RegSrcD);
						  
logic [9:0] controls;
logic ALUOp;


//Main Decoder

always_comb
	casex(Op)
		
		2'b00: 
			//Data Processing immediate
			if(Funct[5])
			begin 
				controls = 10'b0000101001;
			end
			//Data Processing Register
			else
			begin
				controls = 10'b0000001001;
			end
		2'b01:
			//LDR
			if(Funct[0])
			begin
				controls = 10'b0001111000;
			end
			//STR
			else
			begin
				controls = 10'b1001110100;
			end
		2'b10:
			//B
			controls = 10'b0110100010;
			
		default:
			//Unimplemented
			controls = 10'bx;
			
		endcase
		
assign {RegSrcD, ImmSrcD, ALUSrcD, MemtoRegD,
RegWriteD, MemWriteD, BranchD, ALUOp} = controls;

always_comb
	if (ALUOp) 
	begin // which DP Instr?
		case(Funct[4:1])
			4'b0100: 
				ALUControlD = 2'b00; // ADD
			4'b0010: 
				ALUControlD = 2'b01; // SUB
			4'b0000: 
				ALUControlD = 2'b10; // AND
			4'b1100: 
				ALUControlD = 2'b11; // ORR
			default: 
				ALUControlD = 2'bx; // unimplemented
		endcase
		// update flags if S bit is set (C & V only for arith)
		FlagWriteD[1] = Funct[0];
		FlagWriteD[0] = Funct[0] & (ALUControlD == 2'b00 | ALUControlD == 2'b01);
		end 
		else 
		begin
			ALUControlD = 2'b00; // add for non-DP instructions
			FlagWriteD = 2'b00; // don't update Flags
		end

		//PC Logic
		assign PCSrcD = ((Rd == 4'b1111) & RegWriteD) | BranchD;
		
endmodule



			