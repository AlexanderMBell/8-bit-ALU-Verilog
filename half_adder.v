`timescale 1ns / 1ps

module half_adder (input_1, input_2, c_1, s_1);

input input_1;
input input_2;
output c_1;
output s_1;

assign c_1 = input_1 & input_2;
assign s_1 = ((!(input_1 & input_2))&(input_1 | input_2));

endmodule
