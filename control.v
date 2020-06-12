module control(op, fun, select, B, J, RegDst, RegWr, MenWr, MentoReg, ALUSrc, Extop, aluf, shfsrc, jar, jr);

  input [5:0] op, fun;
  input [4:0] select;
  output [4:0] aluf;
  output B, J, RegDst, RegWr, MenWr, MentoReg, ALUSrc, Extop;
  output shfsrc, jar, jr;

  wire [4:0] ALUctr, ALUop;
  wire r, shfsrc1, jr1;
  reg shfsrc, jr;

  aluControl aluc(fun, ALUctr, shfsrc1, jar, jr1);
  mainControl main(op, select, B, J, RegDst, RegWr, MenWr, MentoReg, ALUSrc, Extop, ALUop, r);
  mux2_5 mux2(ALUop, ALUctr, r, aluf);

  always @ ( * ) begin
    if (r == 1) begin
      shfsrc = shfsrc1;
      jr = jr1;
      end
    else begin
      shfsrc = 0;
      jr = 0;
      end
  end

endmodule
