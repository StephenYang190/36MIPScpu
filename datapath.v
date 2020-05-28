module datapath();
  //wire parameter
  wire [31:0] ins;
  wire [4:0] Rd, Rt, Rs, Rw, aluctr, shft;
  wire [31:0] busW, busA, busB, aluout, tomux2_1, aluin, menout;
  wire [15:0] imm16;
  wire B, J, Z, O, RegDst, RegWr, MenWr, MentoReg, ALUSrc, Extop;

  reg clk;

  initial
  begin
    clk = 0;
  end

  always #100 clk = ~clk;

  //block
  //mux2
  mux2_5 mux1(Rt, Rd, RegDst, Rw);
  mux2_32 mux2(busB, tomux2_1, ALUSrc, aluin);
  mux2_32 mux3(aluout, menout, MentoReg, busW);

  //Ext
  Ext exend(Extop, imm16, tomux2_1);

  //Instruction fetch unit
  InstructionFU ifu(B, J, Z, imm16, ins, clk);

  //registers
  registers rgi(RegWr, Rw, Rs, Rt, busW, busA, busB, clk);

  //data memery
  DM dm(MenWr, aluout, busB, menout, ins[31:26], clk);

  //ALU
  ALU alu(busA, aluin, shft, aluout, Z, O, aluctr);

  //control
  control con(ins[31:26], ins[5:0], B, J, RegDst, RegWr, MenWr, MentoReg, ALUSrc, Extop, aluctr);

  assign Rs = ins[25:21];
  assign Rt = ins[20:16];
  assign Rd = ins[15:11];
  assign imm16 = ins[15:0];
  assign shft = ins[10:6];

endmodule
