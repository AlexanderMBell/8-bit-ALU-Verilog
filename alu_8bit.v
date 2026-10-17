`timescale 1ns / 1ps

module alu_8bit (input_1,input_2,opt,result,Z,N,C,V);

  input[7:0] input_1,input_2;
  input[2:0] opt;

  output reg[7:0] result;
  output reg C,V;
  output Z,N;

  wire[8:0] add_result;
  wire[8:0] sub_result;
  wire[7:0] and_result;
  wire[7:0] or_result;
  wire[7:0] xor_result;

  adder_8bit instadd (
    .input_1(input_1),
    .input_2(input_2),
    .ans(add_result)
  );

  subtractor_8bit instsub (
    .input_1(input_1),
    .input_2(input_2),
    .ans(sub_result)
  );

  logic_8bit inst (
  .input_1(input_1),
  .input_2(input_2),
  .and_out(and_result),
  .or_out(or_result),
  .xor_out(xor_result)
);

always @(*) 
begin
case(opt)

3'b000: begin
  result = add_result[7:0];
  C = add_result[8];
  V = (input_1[7] ~^ input_2[7]) & (input_1[7] ^ add_result[7]);
end
3'b001: begin 
  result = sub_result[7:0];
  C = ~sub_result[8];
  V = (input_1[7] ^ input_2[7]) & (input_1[7] ^ sub_result[7]);
end
3'b010: begin
  result = and_result;
  C = 0;
  V = 0;
end
3'b011: begin 
  result = or_result;
  C = 0;
  V = 0;
end
3'b111: begin
  result = xor_result;
  C = 0;
  V = 0;
end
default: begin 
  result = 0;
  C = 0;
  V = 0;
end

endcase
end

assign Z = (result == 0);
assign N = (result[7] == 1);



endmodule
