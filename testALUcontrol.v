module testALUcontrol ();
  reg [5:0] func;

  wire [4:0] aluctr;
  wire shfsrc, jar, jr;

  initial begin
    func = 0;
    forever #10 func = func + 1;
  end

  aluControl aluc(func, aluctr, shfsrc, jar, jr);
  
endmodule // testALUcontrol
