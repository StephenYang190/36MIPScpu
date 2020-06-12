module testExt ();
  reg Extop;
  reg [15:0] x;

  wire [15:0] y;

  initial begin
    x = 16'dFFF0;
    Extop = 0;
    #10 Extop = 1;
    #10 x = 1;
    #10 Extop = 0;
  end

  Ext ext(Extop, x, y);
endmodule // testExt
