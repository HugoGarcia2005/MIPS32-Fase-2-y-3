`timescale 1ns/1ns
module BFF2 (
	input clk,
	
	input [31:0] in_Sumador1_Sumador2,
	input [31:0] in_BR_ALU_d1,
	input [31:0] in_BR_MuxAluYMemDatos_d2,
	input [31:0] in_signextend_ACYSMuxAluYShift,
	input [4:0] in_instruccionRT_MuxI,
	input [4:0] in_instruccionRD_MuxI,
	
	input in_UC_MuxI_RegDst,
	input in_UC_Branch_Branch,
	input in_UC_MemDatos_MemToRead,
	input [2:0] in_UC_AC_ALUOp,
	input in_UC_MemDatos_MemToWrite,
	input in_UC_MuxAlu_ALUSrc,
	input in_UC_BR_RegWrite,
	input in_UC_MuxMemDatos_MemToReg,

	input in_UC_MuxJumper_Jump,
	input [31:0] in_Shift_MuxJumper,
	
	output reg [31:0] out_Sumador1_Sumador2,
	output reg [31:0] out_BR_ALU_d1,
	output reg [31:0] out_BR_MuxAluYMemDatos_d2,
	output reg [31:0] out_signextend_ACYSMuxAluYShift,
	output reg [4:0] out_instruccionRT_MuxI,
	output reg [4:0] out_instruccionRD_MuxI,	
	
	output reg out_UC_MuxI_RegDst,
	output reg out_UC_Branch_Branch,
	output reg out_UC_MemDatos_MemToRead,
	output reg [2:0] out_UC_AC_ALUOp,
	output reg out_UC_MemDatos_MemToWrite,
	output reg out_UC_MuxAlu_ALUSrc,
	output reg out_UC_BR_RegWrite,
	output reg out_UC_MuxMemDatos_MemToReg,	

	output reg out_UC_MuxJumper_Jump,
	output reg [31:0] out_Shift_MuxJumper
);

always @(posedge clk) begin
	out_Sumador1_Sumador2 <= in_Sumador1_Sumador2;
	out_BR_ALU_d1 <= in_BR_ALU_d1;
	out_BR_MuxAluYMemDatos_d2 <= in_BR_MuxAluYMemDatos_d2;
	out_signextend_ACYSMuxAluYShift <= in_signextend_ACYSMuxAluYShift;
	out_instruccionRT_MuxI <= in_instruccionRT_MuxI;
	out_instruccionRD_MuxI <= in_instruccionRD_MuxI;
	out_UC_MuxI_RegDst <= in_UC_MuxI_RegDst;
	out_UC_Branch_Branch <= in_UC_Branch_Branch;
	out_UC_MemDatos_MemToRead <= in_UC_MemDatos_MemToRead;
	out_UC_AC_ALUOp <= in_UC_AC_ALUOp;
	out_UC_MemDatos_MemToWrite <= in_UC_MemDatos_MemToWrite;
	out_UC_MuxAlu_ALUSrc <= in_UC_MuxAlu_ALUSrc;
	out_UC_BR_RegWrite <= in_UC_BR_RegWrite;
	out_UC_MuxMemDatos_MemToReg <= in_UC_MuxMemDatos_MemToReg;
	out_UC_MuxJumper_Jump <= in_UC_MuxJumper_Jump;
	out_Shift_MuxJumper <= in_Shift_MuxJumper;
end
endmodule