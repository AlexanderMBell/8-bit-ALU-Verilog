`timescale 1ns / 1ps

module full_subtractor (input_1, input_2, borrow_in, dif, borrow_out);

  input input_1;
  input input_2;
  input borrow_in;
  output dif;
  output borrow_out;

  assign borrow_out = ((~input_1 & input_2) | ((input_1 ~^ input_2) & borrow_in));
  assign dif = ((input_1 ^ input_2) ^ borrow_in);

endmodule
