module testInstructionFU ();
  reg B, J, Z, clk, reset, jr;
  reg [15:0] imme;
  reg [31:0] regpc;

  wire [31:0] ins, nextpc;

  initial begin
    B = 0;
    J = 0;
    Z = 0;
    clk = 0;
    reset = 1;
    jr = 0;

    imme = 1;
    regpc = 2;

    #20 reset = 0;
    #40 B = 1;
    #20 Z = 1;
    #20 B = 0;
    #20 J = 1;
    #20 J = 0;
    #20 jr = 1;

  end

  always #10 clk = ~clk;

    InstructionFU infu(B, J, Z, imme, ins, clk, reset, nextpc, jr, regpc);

endmodule // testInstructionFU
