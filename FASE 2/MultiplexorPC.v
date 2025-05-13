module MUX_PC (
	input [31:0] add_fetch,
	input [31:0] add_result_sumador2,
	input PCSrc,
	output reg [31:0] W_data_BR
);

always @* begin
	if (PCSrc) begin
		W_data_BR <= add_result_sumador2;
	end
	else begin
		W_data_BR <= add_fetch;
	end
end

endmodule

