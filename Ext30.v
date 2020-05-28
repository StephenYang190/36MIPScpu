module Ext30(Extop, x, y);

  input Extop;
  input [15:0] x;
  output [29:0] y;

  reg [31:0] y;
  parameter ZERO = 30'b0, ONE = 30'hffff0000;

  always @(Extop or x)
  begin
    if (Extop == 0)
      y = ZERO + x;
    else
      y = {{14{x[15]}}, x};
  end

endmodule
