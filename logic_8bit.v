`timescale 1ns / 1ps

//8-Bit Logic Functions Module
module logic_8bit (input_1, input_2, and_out, or_out, xor_out);

    // I/O
    input[7:0] input_1;
    input[7:0] input_2;
    output[7:0] and_out;
    output[7:0] or_out;
    output[7:0] xor_out;

    //All 3 Functions
    assign and_out = input_1 & input_2;
    assign or_out = input_1 | input_2;
    assign xor_out = input_1 ^ input_2;

endmodule
