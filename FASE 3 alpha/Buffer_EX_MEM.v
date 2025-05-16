`timescale 1ns/1ns

module BFF3 (
	input clk,
	
	input [31:0] in_sumador2_MuxPc,
	input in_ALU_Branch_ZF,
	input [31:0] in_ALU_MemDatosYMuxMemDatos,
	input [31:0] in_BR_MemDatos_d2,
	input [4:0] in_MuxI_BR,
	
	input in_UC_Branch_Branch,
	input in_UC_MemDatos_MemToRead,
	input in_UC_MemDatos_MemToWrite,
	input in_UC_BR_RegWrite,
	input in_UC_MuxMemDatos_MemToReg,

	input in_UC_MuxJumper_Jump,
	input [31:0] in_Shift_MuxJumper,
	
	output reg [31:0] out_sumador2_MuxPc,
	output reg out_ALU_Branch_ZF,
	output reg [31:0] out_ALU_MemDatosYMuxMemDatos,
	output reg [31:0] out_BR_MemDatos_d2,
	output reg [4:0] out_MuxI_BR,
	
	output reg out_UC_Branch_Branch,
	output reg out_UC_MemDatos_MemToRead,
	output reg out_UC_MemDatos_MemToWrite,
	output reg out_UC_BR_RegWrite,
	output reg out_UC_MuxMemDatos_MemToReg
	
	output reg out_UC_MuxJumper_Jump,
	output reg [31:0] out_Shift_MuxJumper
);

always @(posedge clk) begin
	out_sumador2_MuxPc <= in_sumador2_MuxPc;
	out_ALU_Branch_ZF <= in_ALU_Branch_ZF;
	out_ALU_MemDatosYMuxMemDatos <= in_ALU_MemDatosYMuxMemDatos;
	out_BR_MemDatos_d2 <= in_BR_MemDatos_d2;
	out_MuxI_BR <= in_MuxI_BR;
	out_UC_Branch_Branch <= in_UC_Branch_Branch;
	out_UC_MemDatos_MemToRead <= in_UC_MemDatos_MemToRead;
	out_UC_MemDatos_MemToWrite <= in_UC_MemDatos_MemToWrite;
	out_UC_BR_RegWrite <= in_UC_BR_RegWrite;
	out_UC_MuxMemDatos_MemToReg <= in_UC_MuxMemDatos_MemToReg;
	out_UC_MuxJumper_Jump <= in_UC_MuxJumper_Jump;
	out_Shift_MuxJumper <= in_Shift_MuxJumper;
end

endmodule
