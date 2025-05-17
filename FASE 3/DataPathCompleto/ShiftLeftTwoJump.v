module SHIFT_LEFT_2_JUMP (
	input [25:0] entrada,
	output reg [27:0] salidaLeftTwo
);

always @* begin
	salidaLeftTwo = {entrada,2'b00};
end

endmodule
