module AC (
	input [2:0] AluOp, 
	input [5:0] Funct,
	output reg [3:0] Op
);

always @* begin
	case (AluOp)
		//R-type
		3'b010:
			case (Funct)
				//add
				6'b100000:
				begin
					Op = 4'b0010;
				end
				//subtract
				6'b100010:
				begin
					Op = 4'b0110;
				end
				//AND
				6'b100100:
				begin
					Op = 4'b0000;
				end
				//OR
				6'b100101:
				begin
					Op = 4'b0001;
				end
				//set on less than
				6'b101010:
				begin
					Op = 4'b0111;
				end
				//shift
				6'b000000:
				begin
					Op = 4'b1111;
				end
				//mul
				6'b000010:
				begin
					Op = 4'b0011;
				end
				//mod (DIVU)
				6'b011011:
				begin
					Op = 4'b0100;
				end
				//sqrt (RSQRT)
				6'b010110:
				begin
					Op = 4'b0101;
				end								
			endcase
		//SW/LW/ADDI
		3'b000:
		begin
			Op = 4'b0010;
		end
		//branch equal
		3'b001:
		begin 
			Op = 4'b0110;
		end
		//ORI
		3'b011:
		begin
			Op = 4'b0001;
		end
		//ANDI
		3'b101:
		begin
			Op = 4'b0000;
		end	
		//SLTI
		3'b100:
		begin
			Op = 4'b0111;
		end
	endcase
end

endmodule