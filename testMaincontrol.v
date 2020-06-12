module testMaincontrol ();
  wire B, J, RegDst, RegWr, MenWr, MentoReg, ALUSrc, Extop, ALUop, r;

  reg [5:0] op;
  reg [4:0] select;

  initial begin
    op = 0;
    select = 0;
    forever op = op + 1;
  end

  mainControl main(op, select, B, J, RegDst, RegWr, MenWr, MentoReg, ALUSrc, Extop, ALUop, r);

endmodule // testMaincontrol
