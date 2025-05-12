// Terminar (Tamaños de señales)
module Sumador_2(	
	input [31:0] resultado_sumador,
	input [31:0] resultado_shift,
	output reg [31:0]suma
);

always @* begin
	suma = resultado_sumador + resultado_shift;
end

endmodule 
