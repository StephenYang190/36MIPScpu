module ALU(A, B, shft, y, zero, ovflow, aluctr);
input[31:0] A, B;
input [4:0] aluctr;
input [4:0] shft;

output[31:0] y;
output zero, ovflow;

reg[31:0] y;
reg ovflow;

wire signed [31:0] sign_a, sign_b;

assign sign_a = A;
assign sign_b = B;

always@ (*) begin

  case(aluctr)
  5'b00000 : {ovflow, y} = A + B;
  5'b00001 : y = A - B;
  5'b00010 : y = (sign_a < sign_b)?1:0;
  5'b00011 : y = A & B;
  5'b00100 : y = ~(A | B);
  5'b00101 : y = A | B;
  5'b00110 : y = A ^ B;
  5'b00111 : y = B << shft;
  5'b01000 : y = (A < B)?1:0;
  5'b01001 : y = B >>> shft;
  5'b01010 : y = B >> shft;
  5'b10000 : y = (sign_a >= 0)?0:1;
  5'b10001 : y = (sign_a > 0)?0:1;
  5'b10010 : y = (sign_a <= 0)?0:1;
  5'b10011 : y = (sign_a < 0)?0:1;
  default : y = 32'b0;
  endcase

end

assign zero = (y == 0)?1 : 0;

endmodule
