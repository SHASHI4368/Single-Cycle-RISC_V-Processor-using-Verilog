// Top Module

module RISCV(
 input CLK, RESET
);

wire [31:0] PC_OUT_TOP, 
            PC_IN_TOP, 
            IMEM_OUT_TOP,
            RD1_TOP, 
            ALU_MUX_OUT_TOP, 
            RD2_TOP, 
            ALU_OUT_TOP, 
            DMEM_OUT_TOP, 
            IMG_OUT_TOP,
            WRITEBACK_TOP;

wire REGWRITE_TOP, 
     ALUSrc_top, 
     MEMWRITE_TOP, 
     MEMREAD_TOP, 
     MEMTOREG_TOP;

wire [3:0] ALU_CTRL_OUT_TOP;

wire [2:0] ALUOP_TOP;

PCplus4 pc4(
 .fromPC(PC_OUT_TOP), 
 .nextToPC(PC_IN_TOP)
);

ProgramCounter pc(
 .clk(CLK), 
 .reset(RESET), 
 .PC_in(PC_IN_TOP), 
 .PC_out(PC_OUT_TOP)
);

Instruction_Memory imem(
 .clk(CLK), 
 .reset(RESET), 
 .read_address(PC_OUT_TOP), 
 .instruction(IMEM_OUT_TOP)
);

Register_File reg_file(
 .clk(CLK), 
 .reset(RESET), 
 .RegWrite(REGWRITE_TOP), 
 .Rs1(IMEM_OUT_TOP[19:15]), 
 .Rs2(IMEM_OUT_TOP[24:20]), 
 .Rd(IMEM_OUT_TOP[11:7]), 
 .Write_data(WRITEBACK_TOP), 
 .read_data1(RD1_TOP), 
 .read_data2(RD2_TOP)
); 

ALU alu(
 .A(RD1_TOP), 
 .B(ALU_MUX_OUT_TOP), 
 .ALU_control_in(ALU_CTRL_OUT_TOP), 
 .ALU_result(ALU_OUT_TOP), 
 .zero()
);

Mux mux1(
 .Sel(ALUSrc_top), 
 .A1(RD2_TOP),
 .B1(IMG_OUT_TOP), 
 .Mux_out(ALU_MUX_OUT_TOP)
);  

ALU_Control alu_control(
 .ALUOp(ALUOP_TOP), 
 .func7(IMEM_OUT_TOP[31:25]), 
 .func3(IMEM_OUT_TOP[14:12]), 
 .ALUControl_out(ALU_CTRL_OUT_TOP)
); 

Data_Memory dmem(
 .clk(CLK), 
 .reset(RESET), 
 .MemWrite(MEMWRITE_TOP), 
 .MemRead(MEMREAD_TOP), 
 .address(ALU_OUT_TOP), 
 .Writedata(ALU_MUX_OUT_TOP), 
 .Data_out(DMEM_OUT_TOP)
);

Mux2 mux2(
 .Sel(MEMTOREG_TOP), 
 .A2(ALU_OUT_TOP), 
 .B2(DMEM_OUT_TOP), 
 .Mux2_out(WRITEBACK_TOP)
);

Control_Unit control_unit(
 .reset(RESET), 
 .opcode(IMEM_OUT_TOP[6:0]), 
 .RegWrite(REGWRITE_TOP), 
 .MemtoReg(MEMTOREG_TOP), 
 .MemRead(MEMREAD_TOP), 
 .MemWrite(MEMWRITE_TOP), 
 .Branch(), 
 .ALUSrc(ALUSrc_top), 
 .ALUOp(ALUOP_TOP)
);

Immediate_Generator imdgen(
 .instruction(IMEM_OUT_TOP[31:16]),
 .data_out(IMG_OUT_TOP)
);

endmodule