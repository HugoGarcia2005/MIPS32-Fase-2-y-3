`timescale 1ns/1ns
module DATAPATH_FASE2_TB();

reg clk;
reg reset;

DATAPATH_FASE2 datapath_fase2_tb(
	.clk(clk),
	.reset(reset)
);

initial begin
	clk = 0; 
	forever #10 clk = ~clk;
end

initial begin
	reset = 1'b1;
	#20;
	reset = 1'b0;
	#2000;
	//$finish;
end

endmodule