module BRANCH (
	input Zero_Flag,
	input Branch_UC,
	output reg Salida_MUXPC
);

always @* begin
	Salida_MUXPC = Zero_Flag & Branch_UC;
end

endmodule