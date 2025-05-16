//Revisar
module MUX_JUMP (
	input [31:0] entrada_muxPC,
	input [31:0] entrada_Jump,
	input Jump,
	output reg [31:0] salida_a_PC
);

//Cuando jump es 1 se deberia activar entrada_Jump?
always @* begin
	if (Jump) begin
		salida_a_PC <= entrada_muxPC;
	end
	else begin
		salida_a_PC <= entrada_Jump;
	end
end

endmodule

