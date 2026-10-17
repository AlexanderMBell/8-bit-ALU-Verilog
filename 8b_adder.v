`timescale 1ns / 1ps

module adder_8bit (input_1, input_2, ans);

input[7:0] input_1;
input[7:0] input_2;
output[8:0] ans;
wire[8:0] carry;
assign carry[0] = 0;
genvar i;

generate
  for (i=0; i < 8; i = i + 1)
  begin

    full_adder inst (
      .input_1(input_1[i]),
      .input_2(input_2[i]),
      .c_in(carry[i]),
      .s_2(ans[i]),
      .c_2(carry[i+1])
    );

endgenerate

assign ans[8] = carry[8];

endmodule
