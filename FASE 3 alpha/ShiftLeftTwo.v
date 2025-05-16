module SHIFT_LEFT_2 (
	input [31:0] entrada,
	output reg [31:0] salidaLeftTwo
);

always @* begin
	salidaLeftTwo = entrada << 2;
end

endmodule


