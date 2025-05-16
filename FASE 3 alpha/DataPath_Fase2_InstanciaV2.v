module DATAPATH_FASE2 (
	input clk,
	input reset
);

//MUX_PC a PC


//PC a MEM_INST Y SUMADOR
wire [31:0] pc_c1_memInstYsumador1;

//SUMADOR a MUX_PC Y SUMADOR_2
wire [31:0] sumador_c1_muxPCYsumador2;
//SUMADOR a SUMADOR_2
wire [31:0] sumador_c2_sumador2;
wire [31:0] sumador_c3_sumador2;
 
//SUMADOR_2 a MUX_PC
wire [31:0] sumador2_c1_muxPC;
wire [31:0] sumador2_c2_muxPC;

//MEM_INST a UC, BR, SIGN_EXTEND, MUX_I
wire [31:0] instruccion_c1;
wire [31:0] instruccion_c2;
//MEM_INST a MUX_I
wire [4:0] instruccion_c3_RT;
wire [4:0] instruccion_c3_RD;

//BR(data_1) a ALU(op_1)
wire [31:0] br_c1_alu;
wire [31:0] br_c2_alu;

//SIG_EXTEND a AC, MUX_ALU y SHIFT
wire [31:0] signExtend_c1_acYmuxaluYshift;
wire [31:0] signExtend_c2_acYmuxaluYshift;

//SHIFT a SUMADOR_2
wire [31:0] shift_c1_sumador2;

//BR a MUX_ALU Y MEM_DATA
wire [31:0] br_c1_muxaluYmemdata;
wire [31:0] br_c2_muxaluYmemdata;
//BR a MEM_DATA
wire [31:0] br_c3_memdata;

//MUX_ALU a ALU
wire [31:0] muxalu_c1_alu;

//MUX_I a BR
wire [4:0] muxI_c1_br;
wire [4:0] muxI_c2_br;
wire [4:0] muxI_c3_br;

//AC a ALU
wire [3:0] ac_c1_alu;

//ALU(res) a MEM_DATA Y MUX_MEMDATA
wire [31:0] alu_c1_memdataYmuxmemdata;
wire [31:0] alu_c2_memdataYmuxmemdata;
//ALU(res) a MUX_MEMDATA
wire [31:0] alu_c3_muxmemdata;

//MEM_DATA a MUX_MEMDATA
wire [31:0] memdata_c1_muxmemdata;
wire [31:0] memdata_c2_muxmemdata;

//MUX_MEMDATA a BR
wire [31:0] muxmemdata_c1_br;

//ALU(zf) a BRANCH
wire alu_c1_branch;
wire alu_c2_branch;

//BRANCH a MUX_PC
wire branch_c1_muxPC;

//UC(ALUSrc) a MUX_ALU 
wire uc_c1_muxAlu_ALUSrc;
wire uc_c2_muxAlu_ALUSrc;

//UC(ALUOP) a AC
wire [2:0] uc_c1_ac_aluOp;
wire [2:0] uc_c2_ac_aluOp;

//UC(RegDst) a MUX_I
wire uc_c1_muxI_RegDst;
wire uc_c2_muxI_RegDst;

//UC(Branch) a BRANCH
wire uc_c1_branch;
wire uc_c2_branch;
wire uc_c3_branch;

//UC(MemToWrite) a MEM_DATA
wire uc_c1_memdata_MemToWrite;
wire uc_c2_memdata_MemToWrite;
wire uc_c3_memdata_MemToWrite;

//UC(MemToRead) a MEM_DATA
wire uc_c1_memdata_MemToRead;
wire uc_c2_memdata_MemToRead;
wire uc_c3_memdata_MemToRead;

//UC(MemToReg) a MUX_MEMDATA
wire uc_c1_muxmemdata_MemToReg;
wire uc_c2_muxmemdata_MemToReg;
wire uc_c3_muxmemdata_MemToReg;
wire uc_c4_muxmemdata_MemToReg;

//UC(RegToWrite) a BR
wire uc_c1_br_RegToWrite;
wire uc_c2_br_RegToWrite;
wire uc_c3_br_RegToWrite;
wire uc_c4_br_RegToWrite;

//SHIFT a MUX_JUMP (para concatenar)
wire [27:0] shiftjump_c1_muxjump;
//SHIFT a MUX_JUMP (ya concatenado)
wire [31:0] shiftjump_c2_muxjump;
wire [31:0] shiftjump_c3_muxjump;

//UC(Jump) a MUX_JUMP
wire uc_c1_muxjump_Jump;
wire uc_c2_muxjump_Jump;
wire uc_c3_muxjump_Jump; 

//MUX_PC a MUX_JUMP
wire [31:0] muxpc_c1_muxjump;

//MUX_JUMP a PC
wire [31:0] muxjump_c1_pc;

MUX_PC mux_pc_fase2(
	.add_fetch(sumador_c1_muxPCYsumador2),
	.add_result_sumador2(sumador2_c2_muxPC),
	.PCSrc(branch_c1_muxPC),
	.out_muxjump(muxpc_c1_muxjump)
);

MUX_JUMP mux_jump_fase2(
	.entrada_Jump(shiftjump_c3_muxjump),
	.entrada_muxPC(muxpc_c1_muxjump),
	.Jump(uc_c3_muxjump_Jump),
	.salida_a_PC(muxjump_c1_pc)
);

PC pc_fase2(
	.contador(muxjump_c1_pc),
	.clk(clk),
	.reset(reset),
	.acumulador(pc_c1_memInstYsumador1)
);

SUMADOR sumador_fase2(
	.operando(pc_c1_memInstYsumador1),
	.suma(sumador_c1_muxPCYsumador2)
);

MEM_INST mem_inst_fase2(
	.address(pc_c1_memInstYsumador1),
	.dataOut(instruccion_c1)
);

//BF1
BFF1 BFF1_fase2(
	.clk(clk),

	.in_MemInst_Instruccion(instruccion_c1),
	.in_Sumador1_Sumador2(sumador_c1_muxPCYsumador2),

	.out_MemInst_Instruccion(instruccion_c2),
	.out_Sumador1_Sumador2(sumador_c2_sumador2)
);

UC uc_fase2(
	.OpCode(instruccion_c2[31:26]),
	.MemToReg(uc_c1_muxmemdata_MemToReg),
	.MemToRead(uc_c1_memdata_MemToRead),
	.MemToWrite(uc_c1_memdata_MemToWrite),
	.AluOp(uc_c1_ac_aluOp),
	.RegWrite(uc_c1_br_RegToWrite),
	.RegDst(uc_c1_muxI_RegDst),
	.Branch(uc_c1_branch),
	.ALUSrc(uc_c1_muxAlu_ALUSrc),
	.Jump(uc_c1_muxjump_Jump)
);

SHIFT_LEFT_2_JUMP shift_left_2_jump_fase2(
	.entrada(instruccion_c2[25:0]),
	.salidaLeftTwo(shiftjump_c1_muxjump)
);

BR br_fase2(
	.R_register_1(instruccion_c2[25:21]),
	.R_register_2(instruccion_c2[20:16]),
	.W_register(muxI_c3_br),
	.W_data(muxmemdata_c1_br),
	.RegEn(uc_c4_br_RegToWrite),
	.R_data_1(br_c1_alu),
	.R_data_2(br_c1_muxaluYmemdata)
);

SIGN_EXTEND sign_extend_fase2(
	.instruccionOriginal(instruccion_c2[15:0]),
	.instruccionExtendida(signExtend_c1_acYmuxaluYshift)
);

//BF2
BFF2 BFF2_fase2(
	.clk(clk),
	
	.in_Sumador1_Sumador2(sumador_c2_sumador2),
	.in_BR_ALU_d1(br_c1_alu),
	.in_BR_MuxAluYMemDatos_d2(br_c1_muxaluYmemdata),
	.in_signextend_ACYSMuxAluYShift(signExtend_c1_acYmuxaluYshift),
	.in_instruccionRT_MuxI(instruccion_c2[20:16]), //RT: 20:16
	.in_instruccionRD_MuxI(instruccion_c2[15:11]), //RD: 15:11
	
	.in_UC_MuxI_RegDst(uc_c1_muxI_RegDst),
	.in_UC_Branch_Branch(uc_c1_branch),
	.in_UC_MemDatos_MemToRead(uc_c1_memdata_MemToRead),
	.in_UC_AC_ALUOp(uc_c1_ac_aluOp),
	.in_UC_MemDatos_MemToWrite(uc_c1_memdata_MemToWrite),
	.in_UC_MuxAlu_ALUSrc(uc_c1_muxAlu_ALUSrc),
	.in_UC_BR_RegWrite(uc_c1_br_RegToWrite),
	.in_UC_MuxMemDatos_MemToReg(uc_c1_muxmemdata_MemToReg),

	.in_UC_MuxJumper_Jump(uc_c1_muxjump_Jump),
	.in_Shift_MuxJumper({sumador_c2_sumador2[31:28],shiftjump_c1_muxjump}),
	
	.out_Sumador1_Sumador2(sumador_c3_sumador2),
	.out_BR_ALU_d1(br_c2_alu),
	.out_BR_MuxAluYMemDatos_d2(br_c2_muxaluYmemdata),
	.out_signextend_ACYSMuxAluYShift(signExtend_c2_acYmuxaluYshift),
	.out_instruccionRT_MuxI(instruccion_c3_RT),
	.out_instruccionRD_MuxI(instruccion_c3_RD),	
	
	.out_UC_MuxI_RegDst(uc_c2_muxI_RegDst),
	.out_UC_Branch_Branch(uc_c2_branch),
	.out_UC_MemDatos_MemToRead(uc_c2_memdata_MemToRead),
	.out_UC_AC_ALUOp(uc_c2_ac_aluOp),
	.out_UC_MemDatos_MemToWrite(uc_c2_memdata_MemToWrite),
	.out_UC_MuxAlu_ALUSrc(uc_c2_muxAlu_ALUSrc),
	.out_UC_BR_RegWrite(uc_c2_br_RegToWrite),
	.out_UC_MuxMemDatos_MemToReg(uc_c2_muxmemdata_MemToReg),

	.out_UC_MuxJumper_Jump(uc_c2_muxjump_Jump),
	.out_Shift_MuxJumper(shiftjump_c2_muxjump)
);

SHIFT_LEFT_2 shift_left_2_fase2(
	.entrada(signExtend_c2_acYmuxaluYshift),
	.salidaLeftTwo(shift_c1_sumador2)
);

MUX_ALU mux_alu_fase2(
	.R_data_2_BR(br_c2_muxaluYmemdata),
	.signextend(signExtend_c2_acYmuxaluYshift),
	.ALUSrc(uc_c2_muxAlu_ALUSrc),
	.Data_2_ALU(muxalu_c1_alu)
);

MUX_TIPO_I mux_tipo_i_fase2(
	.InstruccionRT(instruccion_c3_RT),
	.InstruccionRD(instruccion_c3_RD),
	.RegDst(uc_c2_muxI_RegDst),
	.W_register_BR(muxI_c1_br)
);

SUMADOR_2 sumador_2_fase2(
	.resultado_sumador(sumador_c3_sumador2),
	.resultado_shift(shift_c1_sumador2),
	.suma(sumador2_c1_muxPC)
);

ALU alu_fase2(
	.Op_1(br_c2_alu),
	.Op_2(muxalu_c1_alu),
	.Op_Alu(ac_c1_alu),
	.ZF(alu_c1_branch),
	.Res(alu_c1_memdataYmuxmemdata)
);

AC ac_fase2(
	.AluOp(uc_c2_ac_aluOp),
	.Funct(signExtend_c2_acYmuxaluYshift[5:0]),
	.Op(ac_c1_alu)
);

//BF3
BFF3 BFF3_fase2(
	.clk(clk),
	
	.in_sumador2_MuxPc(sumador2_c1_muxPC),
	.in_ALU_Branch_ZF(alu_c1_branch),
	.in_ALU_MemDatosYMuxMemDatos(alu_c1_memdataYmuxmemdata),
	.in_BR_MemDatos_d2(br_c2_muxaluYmemdata),
	.in_MuxI_BR(muxI_c1_br),
	
	.in_UC_Branch_Branch(uc_c2_branch),
	.in_UC_MemDatos_MemToRead(uc_c2_memdata_MemToRead),
	.in_UC_MemDatos_MemToWrite(uc_c2_memdata_MemToWrite),
	.in_UC_BR_RegWrite(uc_c2_br_RegToWrite),
	.in_UC_MuxMemDatos_MemToReg(uc_c2_muxmemdata_MemToReg),

	.in_UC_MuxJumper_Jump(uc_c2_muxjump_Jump),
	.in_Shift_MuxJumper(shiftjump_c2_muxjump),
	
	.out_sumador2_MuxPc(sumador2_c2_muxPC),
	.out_ALU_Branch_ZF(alu_c2_branch),
	.out_ALU_MemDatosYMuxMemDatos(alu_c2_memdataYmuxmemdata),
	.out_BR_MemDatos_d2(br_c3_memdata),
	.out_MuxI_BR(muxI_c2_br),
	
	.out_UC_Branch_Branch(uc_c3_branch),
	.out_UC_MemDatos_MemToRead(uc_c3_memdata_MemToRead),
	.out_UC_MemDatos_MemToWrite(uc_c3_memdata_MemToWrite),
	.out_UC_BR_RegWrite(uc_c3_br_RegToWrite),
	.out_UC_MuxMemDatos_MemToReg(uc_c3_muxmemdata_MemToReg),

	.out_UC_MuxJumper_Jump(uc_c3_muxjump_Jump),
	.out_Shift_MuxJumper(shiftjump_c3_muxjump)
);

BRANCH branch_fase2(
	.Zero_Flag(alu_c2_branch),
	.Branch_UC(uc_c3_branch),
	.Salida_MUXPC(branch_c1_muxPC)
);

MEM_DATA mem_data_fase2(
	.address(alu_c2_memdataYmuxmemdata),
	.W_data(br_c3_memdata),
	.Write(uc_c3_memdata_MemToWrite),
	.Read(uc_c3_memdata_MemToRead),
	.R_data(memdata_c1_muxmemdata)
);

//BF4
BFF4 BFF4_fase2(
	.clk(clk),
	
	.in_MemDatos_MuxMemDatos(memdata_c1_muxmemdata),
	.in_ALU_MuxMemDatos(alu_c2_memdataYmuxmemdata),
	.in_MuxI_BR(muxI_c2_br),

	.in_UC_BR_RegWrite(uc_c3_br_RegToWrite),
	.in_UC_MuxMemDatos_MemToReg(uc_c3_muxmemdata_MemToReg),
	
	.out_MemDatos_MuxMemDatos(memdata_c2_muxmemdata),
	.out_ALU_MuxMemDatos(alu_c3_muxmemdata),
	.out_MuxI_BR(muxI_c3_br),

	.out_UC_BR_RegWrite(uc_c4_br_RegToWrite),
	.out_UC_MuxMemDatos_MemToReg(uc_c4_muxmemdata_MemToReg)	
);

MUX_MEM_DATA mux_mem_data_fase2(
	.result_ALU(alu_c3_muxmemdata),
	.read_MEM(memdata_c2_muxmemdata),
	.MemToReg(uc_c4_muxmemdata_MemToReg),
	.W_data_BR(muxmemdata_c1_br)
);

endmodule