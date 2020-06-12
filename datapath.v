module datapath();
  //wire parameter
  wire [31:0] ins;
  wire [4:0] Rd, Rt, Rs, Rw, aluctr, shft;
  wire [31:0] busW, busA, busB, aluout, tomux2_1, aluin, menout, aluin1, nextpc, tomux5_0;
  wire [15:0] imm16;
  wire B, J, Z, O, RegDst, RegWr, MenWr, MentoReg, ALUSrc, Extop;
  wire shfsrc, jar, jr;

  reg clk;
  reg reset;

  initial
  begin
    clk = 0;
    reset = 1;
    #200 reset = 0;
  end

  always #100 clk = ~clk;

  //block
  //mux2
  mux2_5 mux1(Rt, Rd, RegDst, Rw);
  mux2_32 mux2(busB, tomux2_1, ALUSrc, aluin);
  mux2_32 mux3(aluout, menout, MentoReg, tomux5_0);
  mux2_32 mux4(busA, {27'b0,shft}, shfsrc, aluin1);
  mux2_32 mux5(tomux5_0, nextpc, J|jar, busW);

  //Ext
  Ext exend(Extop, imm16, tomux2_1);

  //Instruction fetch unit
  InstructionFU ifu(B, J, Z, imm16, ins, clk, reset, nextpc, jr, busA);

  //registers
  registers rgi(RegWr, Rw, Rs, Rt, busW, busA, busB, clk);

  //data memery
  DM dm(MenWr, aluout, busB, menout, ins[31:26], clk);

  //ALU
  ALU alu(aluin1, aluin, aluout, Z, O, aluctr);

  //control
  control con(ins[31:26], ins[5:0], ins[20:16], B, J, RegDst, RegWr, MenWr, MentoReg, ALUSrc, Extop, aluctr, shfsrc, jar, jr);

  assign Rs = ins[25:21];
  assign Rt = (ins[31:26] == 6'b000011)?5'b11111:ins[20:16];
  assign Rd = ins[15:11];
  assign imm16 = ins[15:0];
  assign shft = ins[10:6];

endmodule
