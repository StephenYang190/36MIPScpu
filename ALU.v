module ALU(A, B, y, zero, ovflow, aluctr);
input[31:0] A, B;
input [4:0] aluctr;

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
  5'b00111 : y = A << B;
  5'b01000 : y = (A < B)?1:0;
  5'b01001 : y = A >>> B;
  5'b01010 : y = A >> B;
  default : y = 32'b0;
  endcase

end

assign zero = (y == 0)?1 : 0;

endmodule
