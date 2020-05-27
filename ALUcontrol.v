module aluControl (func, aluc);
  input [5:0] func;
  output [4:0] aluc;

  reg [4:0] aluc;
  
  always @ (func) begin
    case (func)
      6'b100001: aluc = 5'b00000; //addu
      6'b100011: aluc = 5'b00001; //subu
      6'b101010: aluc = 5'b00010; //slt
      6'b100100: aluc = 5'b00011; //and
      6'b100111: aluc = 5'b00100; //nor
      6'b100101: aluc = 5'b00101; //or
      6'b100110: aluc = 5'b00110; //xor
      6'b000000: aluc = 5'b00111; //sll
      6'b101011: aluc = 5'b01000; //sltu
      6'b001001: aluc = 5'b11111; //jalr
      6'b001000: aluc = 5'b11111; //jr
      6'b000100: aluc = 5'b00111; //sllv
      6'b000011: aluc = 5'b01001; //sra
      6'b000111: aluc = 5'b01001; //srav
      6'b000110: aluc = 5'b01010; //srlv
      6'b000010: aluc = 5'b01010; //srl
      default: aluc = 5'b11111;
    endcase
  end

endmodule // aluControl
