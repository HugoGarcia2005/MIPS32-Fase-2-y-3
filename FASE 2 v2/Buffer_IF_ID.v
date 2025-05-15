`timescale 1ns/1ns

module BFF1 (
	input clk,
	
	input [31:0] in_MemInst_Instruccion,
	input [31:0] in_Sumador1_Sumador2,
	
	output reg [31:0] out_MemInst_Instruccion,
	output reg [31:0] out_Sumador1_Sumador2	
);

always @(posedge clk) begin
	out_MemInst_Instruccion <= in_MemInst_Instruccion;
	out_Sumador1_Sumador2 <= in_Sumador1_Sumador2;
end

endmodule
