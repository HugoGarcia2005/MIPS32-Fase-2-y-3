module MultiplexorTipoI (
	input [4:0] InstruccionRT,
	input [4:0] InstruccionRD,
	input RegDst,
	output reg [4:0] W_register_BR
);

always @* begin
	if (RegDst) begin
		W_register_BR <= InstruccionRD;
	end
	else begin
		W_register_BR <= InstruccionRT;
	end
end

endmodule

