`timescale 1ns/1ns
module Buffer_EX_MEM(
	input clk,
	
	input [31:0] sumador2,
	input Zero_Flag,
	input [31:0] Resultado_ALU,
	input [31:0] Read_Data_2_ID_EX,
	input [4:0] Instruccion_MUX,
	
	input Branch_ID_EX,
	input MemToRead_ID_EX,
	input MemToWrite_ID_EX,
	input RegWrite_ID_EX,
	input MemToReg_ID_EX,
	
	output reg [31:0] sumador2_EX_MEM,
	output reg Zero_Flag_EX_MEM,
	output reg [31:0] Resultado_ALU_EX_MEM,
	output reg [31:0] Read_Data_2_EX_MEM,
	output reg [4:0] Instruccion_MUX_EX_MEM,
	
	output reg Branch_EX_MEM,
	output reg MemToRead_EX_MEM,
	output reg MemToWrite_EX_MEM,
	output reg RegWrite_EX_MEM,
	output reg MemToReg_EX_MEM
	
);
always @(posedge clk) begin
	sumador2_EX_MEM = sumador2;
	Zero_Flag_EX_MEM = Zero_Flag;
	Resultado_ALU_EX_MEM = Resultado_ALU;
	Read_Data_2_EX_MEM = Read_Data_2_ID_EX;
	Instruccion_MUX_EX_MEM = Instruccion_MUX;
	Branch_EX_MEM = Branch_ID_EX;
	MemToRead_EX_MEM = MemToRead_ID_EX;
	MemToWrite_EX_MEM = MemToWrite_ID_EX;
	RegWrite_EX_MEM = RegWrite_ID_EX;
	MemToReg_EX_MEM = MemToReg_ID_EX;
end
endmodule