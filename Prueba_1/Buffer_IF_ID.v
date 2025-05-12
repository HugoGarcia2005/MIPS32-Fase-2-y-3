`timescale 1ns/1ns
module Buffer_IF_ID(
	input clk,
	
	input [31:0] instruccion,
	input [31:0] sumador,
	
	output reg [31:0] instruccion_IF_ID,
	output reg [31:0] sumador_IF_ID	
);
always @(posedge clk) begin
	instruccion_IF_ID = instruccion;
	sumador_IF_ID = sumador;
end
endmodule
