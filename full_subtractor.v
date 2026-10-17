`timescale 1ns / 1ps

//Full-Subtractor Module
module full_subtractor (input_1, input_2, borrow_in, dif, borrow_out);

  // I/O
  input input_1;
  input input_2;
  input borrow_in;
  output dif;
  output borrow_out;

  //Calculate Borrow-out and Difference
  assign borrow_out = ((~input_1 & input_2) | ((input_1 ~^ input_2) & borrow_in));
  assign dif = ((input_1 ^ input_2) ^ borrow_in);

endmodule
