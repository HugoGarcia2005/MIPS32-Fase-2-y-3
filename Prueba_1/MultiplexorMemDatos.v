module MultiplexorMemDatos (
	input [31:0] result_ALU,
	input [31:0] read_MEM,
	input MemToReg,
	output reg [31:0] W_data_BR
);

always @* begin
	if (MemToReg) begin
		W_data_BR <= read_MEM;
	end
	else begin
		W_data_BR <= result_ALU;
	end
end

endmodule

