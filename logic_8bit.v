`timescale 1ns / 1ps

module logic_8bit (input_1, input_2, and_out, or_out, xor_out);

input[7:0] input_1;
input[7:0] input_2;
output[7:0] and_out;
output[7:0] or_out;
output[7:0] xor_out;

assign and_out = input_1 & input_2;
assign or_out = input_1 | input_2;
assign xor_out = input_1 ^ input_2;


endmodule
