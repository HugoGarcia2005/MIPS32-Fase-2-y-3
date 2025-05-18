`timescale 1ns/1ns
module ALU (
	input [31:0] Op_1,
	input [31:0] Op_2,
	input [3:0] Op_Alu,
	output reg ZF,
	output reg [31:0] Res
);

always @*
	begin
	case (Op_Alu)
		//ADD
		4'b0010:
		begin
			Res = Op_1 + Op_2;
		end
		//SUB
		4'b0110:
		begin
			Res = Op_1 - Op_2;
		end
		//AND
		4'b0000:
		begin
			Res = Op_1 & Op_2;
		end
		//OR
		4'b0001:
		begin
			Res = Op_1 | Op_2;
		end
		//SLT
		4'b0111:
		begin
			Res = (Op_1 < Op_2)? 32'd1 : 32'd0;
		end
		//SLL
		4'b1111:
		begin
			Res = Op_2 << 1;
		end
		//MUL
		4'b0011:
		begin
			Res = Op_1 * Op_2;
		end
		//DIVU
		4'b0100:
		begin
			Res = Op_1 % Op_2;
		end
		//RSQRT
		4'b0101:
		begin
			case(Op_1)
            	1: Res = 1;     
            	2, 3: Res = 1;   
            	4, 5, 6, 7, 8: Res = 2;   
            	9, 10, 11, 12, 13, 14, 15: Res = 3;   
            	16, 17, 18, 19, 20, 21, 22, 23, 24: Res = 4;  
            	25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35: Res = 5;   
            	36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48: Res = 6;   
            	49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63: Res = 7;  
            	64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80: Res = 8;  
            	81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99: Res = 9;    
            	100: Res = 10;    
            	default: Res = 0; 
			endcase
		end
		
		default: 
			Res = 32'd0;
	endcase
	
	ZF = (Res == 1'b0)? 1'b1 : 1'b0;
	
end

endmodule
