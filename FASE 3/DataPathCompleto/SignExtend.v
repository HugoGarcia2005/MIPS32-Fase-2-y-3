module SIGN_EXTEND (
	input [15:0] instruccionOriginal,
	output reg [31:0] instruccionExtendida
);

always @* begin
    case (instruccionOriginal[15])
        1'b0: instruccionExtendida = {16'b0000000000000000, instruccionOriginal};
        1'b1: instruccionExtendida = {16'b1111111111111111, instruccionOriginal};
    endcase
end

endmodule
