//Revisar
module SHIFT_LEFT_2_JUMP (
	input [25:0] entrada,
	output reg [27:0] salidaLeftTwo
);

always @* begin
	salidaLeftTwo = {2'b00,salidaLeftTwo};
end

endmodule
