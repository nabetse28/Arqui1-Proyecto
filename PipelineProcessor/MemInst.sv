module MemInst (	input logic [31:0] a,
						output logic [31:0] rd);

logic [31:0] RAM[200:0];


initial
$readmemh("instrucciones.rs",RAM);
assign rd = RAM[a[31:2]]; // word aligned
endmodule