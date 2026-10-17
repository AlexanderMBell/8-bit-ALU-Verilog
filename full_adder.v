`timescale 1ns / 1ps

module full_adder (input_1, input_2, c_in, s_2, c_2);

input input_1;
input input_2;
input c_in;
output s_2;
output c_2;

wire c_i;
wire s_i;

half_adder i1 (
  .input_1(input_1),
  .input_2(input_2),
  .c_1(c_i),
  .s_1(s_i)
);

assign s_2 = s_i ^ c_in;
assign c_2 = c_i | (s_i & c_in);

endmodule
