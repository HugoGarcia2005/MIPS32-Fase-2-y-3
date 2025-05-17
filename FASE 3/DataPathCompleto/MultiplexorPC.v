module MUX_PC (
	input [31:0] add_fetch,
	input [31:0] add_result_sumador2,
	input PCSrc,
	output reg [31:0] out_muxjump
);

always @* begin
	if (PCSrc) begin
		out_muxjump <= add_result_sumador2;
	end
	else begin
		out_muxjump <= add_fetch;
	end
end

endmodule

