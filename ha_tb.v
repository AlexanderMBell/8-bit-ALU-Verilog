`timescale 1ns / 1ps

module ha_tb;

reg a,b;
wire c;
wire s;

half_adder inst1 (
  .input_1(a),
  .input_2(b),
  .c_1(c),
  .s_1(s)
);

initial begin

$monitor("a=%b, b=%b, c=%b, s=%b", a, b, c, s);

a = 0;
b = 0;
#10;
a = 1;
b = 0;
#10;
a = 0;
b = 1;
#10;
a = 1;
b = 1;

#20
$finish();

end

endmodule
