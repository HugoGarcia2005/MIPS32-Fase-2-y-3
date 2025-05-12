`timescale 1ns/1ns
module Buffer_MEM_WB(
	input clk,
	
	input [31:0] R_data_RAM,
	input [31:0] result_ALU,
	input [4:0] Instruccion_MUX_EX_MEM,
	input RegWrite_EX_MEM,
	input MemToReg_EX_MEM,
	
	output reg [31:0] R_data_RAM_MEM_WB,
	output reg [31:0] result_ALU_MEM_WB,
	output reg [4:0] Instruccion_MUX_MEM_WB,
	output reg RegWrite_MEM_WB,
	output reg MemToReg_MEM_WB	
);
always @(posedge clk) begin
	R_data_RAM_MEM_WB = R_data_RAM;
	result_ALU_MEM_WB = result_ALU;
	Instruccion_MUX_MEM_WB = Instruccion_MUX_EX_MEM;
	RegWrite_MEM_WB = RegWrite_EX_MEM;
	MemToReg_MEM_WB = MemToReg_EX_MEM;
end
endmodule