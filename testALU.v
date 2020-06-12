module testALU ();
  reg [31:0] a, b;
  reg [4:0] aluctr;

  wire [31:0] y;
  wire z, o;

  initial begin
    a = 32'dffff_fffe;
    b = 32'd0000_0001;

    aluctr = 0;
    forever #10 aluctr = aluctr + 1;
  end

  ALU alu(a, b, z, o, aluctr);
  
endmodule // testALU
