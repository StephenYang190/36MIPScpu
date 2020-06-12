module InstructionFU(B, J, Z, imme, ins, clk, reset, nextpc, jr, regpc);
  //input parameter
  //B-branch, J-jump, Z-zero, imme-imm16
  //target-jump target
  input B, J, Z;
  input clk;
  input [15:0] imme;
  input reset, jr;
  input [31:0] regpc;

  //output parameter
  //ins-Instructions
  output [31:0] ins;
  output [31:0] nextpc;

  //wire parameter
  wire [29:0] topc, toadd1_0, tomux1_0, tomux2_0, tomux1_1, tomux2_1;
  wire [29:0] toadd2_1;
  wire [25:0] target;
  parameter ONE = 30'b1;

  //block
  //pc
  reg [31:0] pc;

  always@(negedge clk or reset)
  begin
    if (reset == 1)
      pc = 32'h0000_3000;
    else if(jr == 1)
      pc = regpc;
    else
      pc[31:2] <= topc;
  end

  //mux2
  mux2_30 mux1(tomux1_0, tomux1_1, Z&B, tomux2_0);

  mux2_30 mux2(tomux2_0, tomux2_1, J, topc);

  //add address
  Adder add1(toadd1_0, ONE, tomux1_0);
  Adder add2(toadd1_0, toadd2_1, tomux1_1);

  //signext
  Ext30 signext(1, imme, toadd2_1);

  //instruction memery
  IM im({toadd1_0, 2'b00}, ins);

  assign tomux2_1 = {pc[31:28], target[25:0]};
  assign toadd1_0 = pc[31:2];
  assign target = ins[25:0];
  assign nextpc = {tomux1_0, 2'b00};

endmodule
