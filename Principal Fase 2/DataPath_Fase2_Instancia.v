//Version 1
//11 05 2025,4:45pm
module DataPath_Fase2_Instancia(
	input clk,
	input reset
);

UC UC_Fase2(
	.OpCode(),
	.MemToReg(),
	.MemToRead(),
	.MemToWrite(),
	.AluOp(),
	.RegWrite(),
	.RegDst(),
	.Branch(),
	.ALUSrc()
);

MultiplexorPC MultiplexorPC_Fase2(
	.add_fetch(),
	.add_result(),
	.PCSrc(),
	.W_data_BR()
);

PC PC_Fase2(
	.contador(),
	.clk(),
	.reset(),
	.acumulador()
);

SUMADOR SUMADOR_Fase(
	.operando(),
	.suma()
);

MEM_INST MEM_INST_Fase2(
	.address(),
	.dataOut()
);

BR BR_Fase2(
	.R_register_1(),
	.R_register_2(),
	.W_register(),
	.W_data(),
	.RegEn(),
	.R_data_1(),
	.R_data_2()
);

SignExtend SignExtend_Fase2(
	.instruccionOriginal(),
	.instruccionExtendida()
);

ShiftLeftTwo ShiftLeftTwo_Fase2(
	.entrada(),
	.salidaLeftTwo()
);

MultiplexorALU MultiplexorALU_Fase2(
	.R_data_2_BR(),
	.signextend(),
	.ALUSrc(),
	.Data_2_ALU()
);

MultiplexorTipoI MultiplexorTipoI_Fase2(
	.InstruccionRT(),
	.InstruccionRD(),
	.RegDst(),
	.W_register_BR()
);

Sumador_2 Sumador_2_Fase2(
	.resultado_sumador(),
	.resultado_shift(),
	.suma()
);

ALU ALU_Fase2(
	.Op_1(),
	.Op_2(),
	.Op_Alu(),
	.ZF(),
	.Res()
);

AC AC_Fase2(
	.AluOp(),
	.Funct(),
	.Op()
);

Branch Branch_Fase2(
	.Zero_Flag(),
	.Branch_UC(),
	.Salida_MUXPC()
);

MEM MEM_Fase2(
	.address(),
	.W_data(),
	.Write(),
	.Read(),
	.R_data()
);

MultiplexorMemDatos MultiplexorMemDatos_Fase2(
	.result_ALU(),
	.read_MEM(),
	.MemToReg(),
	.W_data_BR()
);

endmodule