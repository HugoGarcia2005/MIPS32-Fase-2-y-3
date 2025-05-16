module MUX_ALU (
	input [31:0] R_data_2_BR,
	input [31:0] signextend,
	input ALUSrc,
	output reg [31:0] Data_2_ALU
);

always @* begin
	if (ALUSrc) begin
		Data_2_ALU <= signextend;
	end
	else begin
		Data_2_ALU <= R_data_2_BR;
	end
end

endmodule

