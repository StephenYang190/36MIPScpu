module mux2_30(a, b, s, y);
input s;
input [29:0] a, b;
output[29:0] y;

assign y = (s==0) ? a : b;
endmodule
