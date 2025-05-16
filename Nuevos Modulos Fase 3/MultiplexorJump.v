module MUX_JUMP (
	input [31:0] entrada_Jump,
	input [31:0] entrada_muxPC,
	input Jump,
	output reg [31:0] salida_a_PC
);

always @* begin
	if (Jump) begin
		salida_a_PC <= entrada_Jump;
	end
	else begin
		salida_a_PC <= entrada_muxPC;
	end
end

endmodule

