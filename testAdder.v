module testAdder ();

  reg [29:0] x1, x2;
  reg [29:0] y;

  initial begin
       x1 = 0;
       x2 = 1;
       #10 x1 = 4;
  end

  Adder add(x1, x2, y);
endmodule // testAdder
