module registers(RegWr, Rw, Ra, Rb, busW, busA, busB, clk);
  input RegWr, clk;
  input [4:0] Rw, Ra, Rb;
  input [31:0] busW;

  output [31:0] busA, busB;

  reg [31:0] regi[31:0];
  reg [31:0] busA, busB;

  integer i;

  initial begin
    for (i=0; i < 32; i=i+1) regi[i] = 0;
  end

  always@(negedge clk)
  begin
    if (RegWr == 1)
      regi[Rw] <= busW;
  end

  always @ (Ra or Rb) begin
    busA = regi[Ra];
    busB = regi[Rb];
  end

endmodule
