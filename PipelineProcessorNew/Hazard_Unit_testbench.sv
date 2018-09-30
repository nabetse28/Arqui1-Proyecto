`timescale 1ns / 100ps
module Hazard_Unit_testbench;
  // test bench wires
  logic [3:0] RA1E;
  logic [3:0] RA2E;
  logic [3:0] WA3M;
  logic [3:0] WA3W;
  logic [3:0] RA1D;
  logic [3:0] RA2D;
  logic [3:0] WA3E;
  logic RegWriteM,RegWriteW,MemtoRegE;
  logic PCSrcD,PCSrcE,PCSrcM,PCSrcW, BranchTakenE;
  logic [1:0] ForwardAE;
  logic [1:0] ForwardBE;
  logic StallF;
  logic StallD;
  logic FlushE;
  logic FlushD;

  // test bench module
  Hazard_Unit U0(
    .RA1E(RA1E),
    .RA2E(RA2E),
    .WA3M(WA3M),
    .WA3W(WA3W),
    .RA1D(RA1D),
    .RA2D(RA2D),
    .WA3E(WA3E),
    .RegWriteM(RegWriteM),
    .RegWriteW(RegWriteW),
    .MemtoRegE(MemtoRegE),
	 .PCSrcD(PCSrcD),
	 .PCSrcE(PCSrcE),
	 .PCSrcM(PCSrcM),
	 .PCSrcW(PCSrcW),
	 .BranchTakenE(BranchTakenE),
    .ForwardAE(ForwardAE),
    .ForwardBE(ForwardBE),
    .StallF(StallF),
    .StallD(StallD),
    .FlushE(FlushE),
	 .FlushD(FlushD)
  );

  initial begin
    #15
    // initial values for register
    RA1E = 32'h0;
    RA2E = 32'h1;
    WA3M = 32'h2;
    WA3W = 32'h3;

    RA1D = 32'h4;
    RA2D = 32'h5;

    WA3E = 32'h6;

    // initial values for operations
    RegWriteM = 1'b0;
    RegWriteW = 1'b0;
    MemtoRegE = 1'b0;
	 

	 PCSrcD = 1'b0;
    PCSrcE = 1'b0;
    PCSrcM = 1'b0;
	 PCSrcW = 1'b0;
    BranchTakenE = 1'b0;

  end

  always begin
      #20;
      // first case to forward the register A
      RA1E = 32'h0000005;
      WA3M = 32'h0000005;
      RegWriteM = 1;
      #20
      // second case to forward the register A
      WA3M = 32'h0000000;
      RA1E = 32'h0000005;
      WA3W = 32'h0000005;
      RegWriteM = 0;
      RegWriteW = 1;
      #20; // resets fowarding for A
      RA1E = 32'h0000000;
      WA3M = 32'h0000002;
      RegWriteM = 0;
      RegWriteW = 0;
      #20; // firs case to forward the register B
      RA2E = 32'h0000005;
      WA3M = 32'h0000005;
      RegWriteM = 1;
      RegWriteW = 0;
      #20; // second case to forward the register B
      RA2E = 32'h0000005;
      WA3W = 32'h0000005;
      WA3M = 32'h0000000;
      RegWriteM = 0;
      RegWriteW = 1;
      #20; // resets fowarding B
      RA2E = 32'h0000001;
      WA3W = 32'h0000003;
      RegWriteM = 0;
      RegWriteW = 0;
      #20; // memory forwarding case 1
      RA1D = 32'h0000005;
      WA3E = 32'h0000005;
      MemtoRegE = 1;
      #20 // memory forwarding case 2
      RA1D = 32'h0000004;
      RA2D = 32'h0000005;
      WA3E = 32'h0000005;
      MemtoRegE = 1;
      #20 // memory fowarding reset
      RA2D = 32'h0000006;
      WA3E = 32'h0000007;
  end

endmodule // hazard_unit_t