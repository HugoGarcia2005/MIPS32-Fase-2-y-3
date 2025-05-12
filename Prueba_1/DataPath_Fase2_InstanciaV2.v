//Version 1
//11 05 2025,11:33pm
module DataPath_Fase2_Instancia(
	input clk,
	input reset
);

//MuxPc a PC
wire [31:0] output_MuxPC_a_input_PC;

//Branch a MuxPc
wire output_Branch_a_input_MuxPc;

//MuxRam a BR
wire [31:0] output_MuxRam_a_input_BR;

//PC a Sumador y BR
wire [31:0] output_PC_a_input_sumador_y_BR;

//Sumador a MuxPC y IF/ID
wire [31:0] output_Sumador_a_input_MuxPc_y_IFID;

//IF/ID a ID/EX (para sumador 1 a 2)
wire [31:0] output_IFID_a_input_IDEX;

//ID/EX a sumador 2
wire [31:0] output_IDEX_a_input_sumador2;

//Sumador 2 a EX/MEM
wire [31:0] output_sumador2_a_input_EXMEM;

//EX/MEM a MuxPC
wire [31:0] output_EXMEM_a_input_MuxPc;


//Mem instrucciones a IF/ID
wire [31:0] output_memIns_a_input_IFID;

//IFID a instrucciones
wire [31:0] output_IFID_a_instrucciones;

// IDEX a MuxI RT
wire [4:0] output_IDEX_a_MuxI_RT;

// IDEX a MuxI RD
wire [4:0] output_IDEX_a_MuxI_RD;

// MuxI a EXMEM
wire [4:0] output_MuxI_a_EXMEM;

// EX/MEM a MEM/WB
wire [4:0] output_EXMEM_a_MEM_WB;

//MEM/WB a BR
wire [4:0] output_MEMWB_a_BR;


//signextend a ID/EX
wire [31:0] output_SignExtend_a_IDEX;

//BR a ID/EX 1
wire [31:0] output_BR_a_IDEX_1;

//BR a ID/EX 2
wire [31:0] output_BR_a_IDEX_2;

//ID/EX a ALU 
wire [31:0] output_IDEX_a_ALU_1;

//ID/EX a MuxALU y EX/MEM
wire [31:0] output_IDEX_a_MuxALU_y_EXMEM;

//EX/MEM a RAM
wire [31:0] output_EXMEM_a_RAM;



//ID/EX a Shift Left 2, MuxALU y AC
wire [31:0] output_IDEX_a_Shift_MuxAlu_AC;

// Shift a Sumador 2
wire [31:0] output_shift_a_sumador_2;

//MuxALU y ALU op2
wire [31:0] output_MuxALU_a_ALU_2;

//AC a ALU
wire [3:0] output_AC_a_ALU;

//ALU a EX/MEM (ZF)
wire output_ALUZF_a_EXMEM;

//EXMEM a Branch
wire output_EXMEM_a_Branch;

// ALU a EX/MEM (resultado)
wire [31:0] output_ALU_a_EXMEM;

//EX/MEM a RAM y MEM/WB
wire [31:0] output_EXMEM_a_RAM_y_MEMWB;

//RAM a MEM/WB
wire [31:0] output_RAM_a_MEMWB;

//MEMWB a MuxRam 0
wire [31:0] output_MEMWB_a_MuxRam_0;

//MEMWB a MuxRam 1
wire [31:0] output_MEMWB_a_MuxRam_1;

//Wires UC:
//UC a ID/EX regDst
wire UC_a_IDEX_regDst;
//ID/EX a MuxI regDst
wire IDEX_a_MuxI_regDst;

//UC a ID/EX Branch
wire UC_a_IDEX_branch;
//ID/EX a EX/MEM
wire IDEX_a_EXMEM_branch;
//EX/MEM a Branch
wire EXMEM_a_Branch;

//UC a ID/EX MemToRead
wire UC_a_IDEX_MemToRead;
//ID/EX a EX/MEM MemToRead
wire IDEX_a_EXMEM_MemToRead;
//EX/MEM a RAM MemToRead
wire EXMEM_a_RAM_MemToRead;

//UC a ID/EX ALUOP
wire [2:0] UC_a_IDEX_ALUOP;
//ID/EX a AC ALUOP
wire [2:0] IDEX_a_AC_ALUOP;

//UC a ID/EX MemToWrite
wire UC_a_IDEX_MemToWrite;
//ID/EX a EX/MEM MemToWrit
wire IDEX_a_EXMEM_MemToWrite;
//EX/MEM a RAM MemToWrite
wire EXMEM_a_RAM_MemToWrite;

//UC a ID/EX ALUSRc
wire UC_a_IDEX_ALUSrc;
//ID/EX a MuxAlu ALUSrc
wire IDEX_a_MuxAlu_ALUSrc;

//UC a ID/EX RegWrite
wire UC_a_IDEX_RegWrite;
//ID/EX a EX/MEM RegWrite
wire IDEX_EXMEM_RegWrite;
//EX/MEM a MEM/WB RegWrite
wire EXMEM_a_MEMWB_RegWrite;
//MEM/WB a BR RegWrite
wire MEMWB_a_BR_RegWrite;

//UC a ID/EX MemToReg
wire UC_a_IDEX_MemToReg;
//ID/EX a EX/MEM MemToReg
wire IDEX_EXMEM_MemToReg;
//EX/MEM a MEM/WB MemToReg
wire EXMEM_a_MEMWB_MemToReg;
//MEM/WN a MuxAlu MemToReg
wire MEMWB_a_MuxRam_MemToReg;

Buffer_IF_ID Buffer_IF_ID_Fase2(
	.clk(clk),
	.instruccion(output_memIns_a_input_IFID),
	.sumador(output_Sumador_a_input_MuxPc_y_IFID),

	.instruccion_IF_ID(output_IFID_a_instrucciones),
	.sumador_IF_ID(output_IFID_a_input_IDEX)
);

Buffer_ID_EX Buffer_ID_EX_Fase2(
	.clk(clk),
	.sumador_IF_ID(output_IFID_a_input_IDEX),
	.Read_Data_1(output_BR_a_IDEX_1),
	.Read_Data_2(output_BR_a_IDEX_2),
	.Instruccion_Extendida(output_SignExtend_a_IDEX),
	.Instruccion_RD(output_IFID_a_instrucciones[20:16]),
	.Instruccion_RT(output_IFID_a_instrucciones[15:11]),
	.RegDst(UC_a_IDEX_regDst),
	.Branch(UC_a_IDEX_branch),
	.MemToRead(UC_a_IDEX_MemToRead),
	.ALUOp(UC_a_IDEX_ALUOP),
	.MemToWrite(UC_a_IDEX_MemToWrite),
	.ALUSrc(UC_a_IDEX_ALUSrc),
	.RegWrite(UC_a_IDEX_RegWrite),
	.MemToReg(UC_a_IDEX_MemToReg),

	.sumador_ID_EX(output_IDEX_a_input_sumador2),
	.Read_Data_1_ID_EX(output_IDEX_a_ALU_1),
	.Read_Data_2_ID_EX(output_IDEX_a_MuxALU_y_EXMEM),
	.Instruccion_Extendida_ID_EX(output_IDEX_a_Shift_MuxAlu_AC),
	.Instruccion_RD_ID_EX(output_IDEX_a_MuxI_RD),
	.Instruccion_RT_ID_EX(output_IDEX_a_MuxI_RT),	
	.RegDst_ID_EX(IDEX_a_MuxI_regDst),
	.Branch_ID_EX(IDEX_a_EXMEM_branch),
	.MemToRead_ID_EX(IDEX_a_EXMEM_MemToRead),
	.ALUOp_ID_EX(IDEX_a_AC_ALUOP),
	.MemToWrite_ID_EX(IDEX_a_EXMEM_MemToWrite),
	.ALUSrc_ID_EX(IDEX_a_MuxAlu_ALUSrc),
	.RegWrite_ID_EX(IDEX_EXMEM_RegWrite),
	.MemToReg_ID_EX(IDEX_EXMEM_MemToReg)
);

Buffer_EX_MEM Buffer_EX_MEM_Fase2(
	.clk(clk),
	.sumador2(output_sumador2_a_input_EXMEM),
	.Zero_Flag(output_ALUZF_a_EXMEM),
	.Resultado_ALU(output_ALU_a_EXMEM),
	.Read_Data_2_ID_EX(output_IDEX_a_MuxALU_y_EXMEM),
	.Instruccion_MUX(output_MuxI_a_EXMEM),
	.Branch_ID_EX(IDEX_a_EXMEM_branch),
	.MemToRead_ID_EX(IDEX_a_EXMEM_MemToRead),
	.MemToWrite_ID_EX(IDEX_a_EXMEM_MemToWrite),
	.RegWrite_ID_EX(IDEX_EXMEM_RegWrite),
	.MemToReg_ID_EX(IDEX_EXMEM_MemToReg),

	.sumador2_EX_MEM(output_EXMEM_a_input_MuxPc),
	.Zero_Flag_EX_MEM(output_EXMEM_a_Branch),
	.Resultado_ALU_EX_MEM(output_EXMEM_a_RAM_y_MEMWB),
	.Read_Data_2_EX_MEM(output_EXMEM_a_RAM),
	.Instruccion_MUX_EX_MEM(output_EXMEM_a_MEM_WB),
	.Branch_EX_MEM(EXMEM_a_Branch),
	.MemToRead_EX_MEM(EXMEM_a_RAM_MemToRead),
	.MemToWrite_EX_MEM(EXMEM_a_RAM_MemToWrite),
	.RegWrite_EX_MEM(EXMEM_a_MEMWB_RegWrite),
	.MemToReg_EX_MEM(EXMEM_a_MEMWB_MemToReg)
);

Buffer_MEM_WB Buffer_MEM_WB_Fase2(
	.clk(clk),
	.R_data_RAM(output_RAM_a_MEMWB),
	.result_ALU(output_EXMEM_a_RAM_y_MEMWB),
	.Instruccion_MUX_EX_MEM(output_EXMEM_a_MEM_WB),
	.RegWrite_EX_MEM(EXMEM_a_MEMWB_RegWrite),
	.MemToReg_EX_MEM(EXMEM_a_MEMWB_MemToReg),

	.R_data_RAM_MEM_WB(output_MEMWB_a_MuxRam_0),
	.result_ALU_MEM_WB(output_MEMWB_a_MuxRam_1),
	.Instruccion_MUX_MEM_WB(output_MEMWB_a_BR),
	.RegWrite_MEM_WB(MEMWB_a_BR_RegWrite),
	.MemToReg_MEM_WB(MEMWB_a_MuxRam_MemToReg)
);

UC UC_Fase2(
	.OpCode(output_IFID_a_instrucciones[31:26]),
	.MemToReg(UC_a_IDEX_MemToReg),
	.MemToRead(UC_a_IDEX_MemToRead),
	.MemToWrite(UC_a_IDEX_MemToWrite),
	.AluOp(UC_a_IDEX_ALUOP),
	.RegWrite(UC_a_IDEX_RegWrite),
	.RegDst(UC_a_IDEX_regDst),
	.Branch(UC_a_IDEX_branch),
	.ALUSrc(UC_a_IDEX_ALUSrc)
);

MultiplexorPC MultiplexorPC_Fase2(
	.add_fetch(output_Sumador_a_input_MuxPc_y_IFID),
	.add_result(output_EXMEM_a_input_MuxPc),
	.PCSrc(output_Branch_a_input_MuxPc),
	.W_data_BR(output_MuxPC_a_input_PC)
);

PC PC_Fase2(
	.contador(output_MuxPC_a_input_PC),
	.clk(clk),
	.reset(reset),
	.acumulador(output_PC_a_input_sumador_y_BR)
);

SUMADOR SUMADOR_Fase(
	.operando(output_PC_a_input_sumador_y_BR),
	.suma(output_Sumador_a_input_MuxPc_y_IFID)
);

MEM_INST MEM_INST_Fase2(
	.address(output_PC_a_input_sumador_y_BR),
	.dataOut(output_memIns_a_input_IFID)
);

BR BR_Fase2(
	.R_register_1(output_IFID_a_instrucciones[25:21]),
	.R_register_2(output_IFID_a_instrucciones[20:16]),
	.W_register(output_MEMWB_a_BR),
	.W_data(output_MuxRam_a_input_BR),
	.RegEn(MEMWB_a_BR_RegWrite),
	.R_data_1(output_BR_a_IDEX_1),
	.R_data_2(output_BR_a_IDEX_2)
);

SignExtend SignExtend_Fase2(
	.instruccionOriginal(output_IFID_a_instrucciones[15:0]),
	.instruccionExtendida(output_SignExtend_a_IDEX)
);

ShiftLeftTwo ShiftLeftTwo_Fase2(
	.entrada(output_IDEX_a_Shift_MuxAlu_AC),
	.salidaLeftTwo(output_shift_a_sumador_2)
);

MultiplexorALU MultiplexorALU_Fase2(
	.R_data_2_BR(output_IDEX_a_MuxALU_y_EXMEM),
	.signextend(output_IDEX_a_Shift_MuxAlu_AC),
	.ALUSrc(IDEX_a_MuxAlu_ALUSrc),
	.Data_2_ALU(output_MuxALU_a_ALU_2)
);

MultiplexorTipoI MultiplexorTipoI_Fase2(
	.InstruccionRT(output_IDEX_a_MuxI_RT),
	.InstruccionRD(output_IDEX_a_MuxI_RD),
	.RegDst(IDEX_a_MuxI_regDst),
	.W_register_BR(output_MuxI_a_EXMEM)
);

Sumador_2 Sumador_2_Fase2(
	.resultado_sumador(output_IDEX_a_input_sumador2),
	.resultado_shift(output_shift_a_sumador_2),
	.suma(output_sumador2_a_input_EXMEM)
);

ALU ALU_Fase2(
	.Op_1(output_IDEX_a_ALU_1),
	.Op_2(output_MuxALU_a_ALU_2),
	.Op_Alu(output_AC_a_ALU),
	.ZF(output_ALUZF_a_EXMEM),
	.Res(output_ALU_a_EXMEM)
);

AC AC_Fase2(
	.AluOp(IDEX_a_AC_ALUOP),
	.Funct(output_IDEX_a_Shift_MuxAlu_AC[5:0]),
	.Op(output_AC_a_ALU)
);

Branch Branch_Fase2(
	.Zero_Flag(output_EXMEM_a_Branch),
	.Branch_UC(EXMEM_a_Branch),
	.Salida_MUXPC(output_Branch_a_input_MuxPc)
);

MEM MEM_Fase2(
	.address(output_EXMEM_a_RAM_y_MEMWB),
	.W_data(output_EXMEM_a_RAM),
	.Write(EXMEM_a_RAM_MemToWrite),
	.Read(EXMEM_a_RAM_MemToRead),
	.R_data(output_RAM_a_MEMWB)
);

MultiplexorMemDatos MultiplexorMemDatos_Fase2(
	.result_ALU(output_MEMWB_a_MuxRam_1),
	.read_MEM(output_MEMWB_a_MuxRam_0),
	.MemToReg(MEMWB_a_MuxRam_MemToReg),
	.W_data_BR(output_MuxRam_a_input_BR)
);

endmodule