module test_im();
reg [31:0] addr;
wire [31:0] out;

initial begin
addr = 32'h0000_0000;
end

always #100 addr = addr + 4;

IM im(addr, out);

endmodule
