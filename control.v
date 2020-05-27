module control(op, fun, B, J, RegDst, RegWr, MenWr, MentoReg, ALUSrc, Extop, aluf);

  input [5:0] op, fun;
  output [4:0] aluf;
  output B, J, RegDst, RegWr, MenWr, MentoReg, ALUSrc, Extop;

  wire [4:0] ALUctr, ALUop;
  wire r;

  aluControl aluc(fun, ALUctr);
  mainControl main(op, B, J, RegDst, RegWr, MenWr, MentoReg, ALUSrc, Extop, ALUop, r);
  mux2_5 mux2(ALUop, ALUctr, r, aluf);

endmodule
