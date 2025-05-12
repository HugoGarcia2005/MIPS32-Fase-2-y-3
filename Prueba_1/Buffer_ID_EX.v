`timescale 1ns/1ns
module Buffer_ID_EX(
	input clk,
	
	input [31:0] sumador_IF_ID,
	input [31:0] Read_Data_1,
	input [31:0] Read_Data_2,
	input [31:0] Instruccion_Extendida,
	input [4:0] Instruccion_RD,
	input [4:0] Instruccion_RT,
	
	input RegDst,
	input Branch,
	input MemToRead,
	input [2:0] ALUOp,
	input MemToWrite,
	input ALUSrc,
	input RegWrite,
	input MemToReg,
	
	output reg [31:0] sumador_ID_EX,
	output reg [31:0] Read_Data_1_ID_EX,
	output reg [31:0] Read_Data_2_ID_EX,
	output reg [31:0] Instruccion_Extendida_ID_EX,
	output reg [4:0] Instruccion_RD_ID_EX,
	output reg [4:0] Instruccion_RT_ID_EX,	
	
	output reg RegDst_ID_EX,
	output reg Branch_ID_EX,
	output reg MemToRead_ID_EX,
	output reg [2:0] ALUOp_ID_EX,
	output reg MemToWrite_ID_EX,
	output reg ALUSrc_ID_EX,
	output reg RegWrite_ID_EX,
	output reg MemToReg_ID_EX	
);
always @(posedge clk) begin
	sumador_ID_EX = sumador_IF_ID;
	Read_Data_1_ID_EX = Read_Data_1;
	Read_Data_2_ID_EX = Read_Data_2;
	Instruccion_Extendida_ID_EX = Instruccion_Extendida;
	Instruccion_RD_ID_EX = Instruccion_RD;
	Instruccion_RT_ID_EX = Instruccion_RT;
	RegDst_ID_EX = RegDst;
	Branch_ID_EX = Branch;
	MemToRead_ID_EX = MemToRead;
	ALUOp_ID_EX = ALUOp;
	MemToWrite_ID_EX = MemToWrite;
	ALUSrc_ID_EX = ALUSrc;
	RegWrite_ID_EX = RegWrite;
	MemToReg_ID_EX = MemToReg;
end
endmodule