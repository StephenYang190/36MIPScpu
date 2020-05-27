module IM(addr, out);
  input [31:0] addr;

  output [31:0] out;

  reg [31:0] im[1023:0];

  initial begin
    $readmemh("C:/Users/97927/OneDrive - nuaa.edu.cn/Desktop/computerExercise/cpu/code.txt", im);
  end

  assign out = im[addr[11:2]];

endmodule
