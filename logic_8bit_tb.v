`timescale 1ns / 1ps

module logic_8bit_tb;

reg[7:0] a,b;
wire[7:0] c,d,e;

logic_8bit inst (
  .input_1(a),
  .input_2(b),
  .and_out(c),
  .or_out(d),
  .xor_out(e)
);

initial begin

$monitor("a=%b, b=%b, c=%b, d=%b, e=%b", a, b, c, d, e);

a = 8'b10101100;
b = 8'b11001010;
#10;

a = 8'b00000000;
b = 8'b00000000;
#10;

a = 8'b11110000;
b = 8'b00001111;
#10;

a = 8'b01010101;
b = 8'b01010101;
#10;

#20;
$finish();


end

endmodule
