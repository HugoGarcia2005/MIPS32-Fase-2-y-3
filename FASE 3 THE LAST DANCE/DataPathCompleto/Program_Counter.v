`timescale 1ns/1ns

module PC (
	input [31:0]contador,
	input clk,
	input reset,
	output reg [31:0]acumulador
);

always @(posedge clk) begin
	if(reset)begin
		acumulador <= 32'd0;
	end
	else begin
		acumulador <=  contador;
	end
end

endmodule
