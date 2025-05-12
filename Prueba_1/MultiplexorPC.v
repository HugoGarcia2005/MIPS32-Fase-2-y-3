//Terminar (no se que tamaño de señal xd)
module MultiplexorPC (
	input [31:0] add_fetch,
	input [31:0] add_result,
	input PCSrc,
	output reg [31:0] W_data_BR
);

always @* begin
	if (PCSrc) begin
		W_data_BR <= add_result;
	end
	else begin
		W_data_BR <= add_fetch;
	end
end

endmodule

