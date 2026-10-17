`timescale 1ns / 1ps

module adder_8bit_tb;

reg [7:0] a,b;
wire [8:0] c;

adder_8bit inst (
  .input_1(a[7:0]),
  .input_2(b[7:0]),
  .ans(c[8:0])
);

initial begin

$monitor("a=%b, b=%b, c=%b", a, b, c);

a = 8'b00001100;
b = 8'b00000101;

#10;

a = 8'b00111111;
b = 8'b00000001;

#10;

a = 8'b11111111;
b = 8'b00000001;

#20;

$finish();

end

endmodule