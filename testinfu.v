module test_infu();
wire [31:0] ins;
wire [15:0] imm16;
wire B, J, Z;

reg clk;

initial
begin
  clk = 0;
end

always #100 clk = ~clk;

assign imm16 = ins[15:0];

InstructionFU ifu(B, J, Z, imm16, ins, clk);

endmodule
