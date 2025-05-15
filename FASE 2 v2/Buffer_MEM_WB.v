`timescale 1ns/1ns
module BFF4 (
	input clk,
	
	input [31:0] in_MemDatos_MuxMemDatos,
	input [31:0] in_ALU_MuxMemDatos,
	input [4:0] in_MuxI_BR,

	input in_UC_BR_RegWrite,
	input in_UC_MuxMemDatos_MemToReg,
	
	output reg [31:0] out_MemDatos_MuxMemDatos,
	output reg [31:0] out_ALU_MuxMemDatos,
	output reg [4:0] out_MuxI_BR,

	output reg out_UC_BR_RegWrite,
	output reg out_UC_MuxMemDatos_MemToReg	
);

always @(posedge clk) begin
	out_MemDatos_MuxMemDatos <= in_MemDatos_MuxMemDatos;
	out_ALU_MuxMemDatos <= in_ALU_MuxMemDatos;
	out_MuxI_BR <= in_MuxI_BR;
	out_UC_BR_RegWrite <= in_UC_BR_RegWrite;
	out_UC_MuxMemDatos_MemToReg <= in_UC_MuxMemDatos_MemToReg;
end

endmodule