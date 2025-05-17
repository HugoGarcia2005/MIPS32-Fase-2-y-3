module UC (
	input [5:0] OpCode,

	output reg MemToReg,
	output reg MemToRead,
	output reg MemToWrite,
	output reg [2:0] AluOp,
	output reg RegWrite,

	output reg RegDst,
	output reg Branch,
	output reg ALUSrc,
	output reg Jump
);

always @* begin
	case (OpCode)
		//Type-R
		6'b000000:
			begin
			MemToReg = 1'b0;
			MemToRead = 1'b0;
			MemToWrite = 1'b0;
			AluOp = 3'b010;
			RegWrite = 1'b1;
			
			RegDst = 1'b1;
			Branch = 1'b0;
			ALUSrc = 1'b0;
			Jump = 1'b0;
			end
		//SW
		6'b101011:
			begin
			MemToReg = 1'b0;
			MemToRead = 1'b0;
			MemToWrite = 1'b1;
			AluOp = 3'b000;
			RegWrite = 1'b0;

			RegDst = 1'b0;
			Branch = 1'b0;
			ALUSrc = 1'b1;
			Jump = 1'b0;				
			end
		//LW
		6'b100011:
			begin
			MemToReg = 1'b1;
			MemToRead = 1'b1;
			MemToWrite = 1'b0;
			AluOp = 3'b000;
			RegWrite = 1'b1;

			RegDst = 1'b0;
			Branch = 1'b0;
			ALUSrc = 1'b1;
			Jump = 1'b0;				
			end
		//ORI
		6'b001101:
			begin
			MemToReg = 1'b0;
			MemToRead = 1'b0;
			MemToWrite = 1'b0;
			AluOp = 3'b011;
			RegWrite = 1'b1;

			RegDst = 1'b0;
			Branch = 1'b0;
			ALUSrc = 1'b1;
			Jump = 1'b0;				
			end
		//ANDI
		6'b001100:
			begin
			MemToReg = 1'b0;
			MemToRead = 1'b0;
			MemToWrite = 1'b0;
			AluOp = 3'b101;
			RegWrite = 1'b1;

			RegDst = 1'b0;
			Branch = 1'b0;
			ALUSrc = 1'b1;
			Jump = 1'b0;				
			end
		//ADDI
		6'b001000:
			begin
			MemToReg = 1'b0;
			MemToRead = 1'b0;
			MemToWrite = 1'b0;
			AluOp = 3'b000;
			RegWrite = 1'b1;

			RegDst = 1'b0;
			Branch = 1'b0;
			ALUSrc = 1'b1;
			Jump = 1'b0;				
			end		
		//SLTI
		6'b001010:
			begin
			MemToReg = 1'b0;
			MemToRead = 1'b0;
			MemToWrite = 1'b0;
			AluOp = 3'b100;
			RegWrite = 1'b1;

			RegDst = 1'b0;
			Branch = 1'b0;
			ALUSrc = 1'b1;
			Jump = 1'b0;				
			end	
		//BEQ
		6'b000100:
			begin
			MemToReg = 1'b0;
			MemToRead = 1'b0;
			MemToWrite = 1'b0;
			AluOp = 3'b001;
			RegWrite = 1'b0;

			RegDst = 1'b0;
			Branch = 1'b1;
			ALUSrc = 1'b0;
			Jump = 1'b0;				
			end
		//JUMP
		6'b000010:
			begin
			MemToReg = 1'b0;
			MemToRead = 1'b0;
			MemToWrite = 1'b0;
			AluOp = 3'b000;
			RegWrite = 1'b0;

			RegDst = 1'b0;
			Branch = 1'b0;
			ALUSrc = 1'b0;
			Jump = 1'b0;	
			Jump = 1'b1;				
			end
	endcase
end

endmodule
