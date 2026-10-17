`timescale 1ns / 1ps

//Full-Adder Test Bench
module fa_tb;

  //Variables
  reg a,b,c;
  wire c2;
  wire s2;

  //Instantiate
  full_adder fa_inst1 (
    .input_1(a),
    .input_2(b),
    .c_in(c),
    .s_2(s2),
    .c_2(c2)
  );

  //Run Manual Testing
  initial begin
    $monitor("a=%b, b=%b, c=%b, s2=%b, c2=%b", a, b, c, s2, c2);
    a=0;
    b=0;
    c=0;
    #10;
    a=1;
    b=0;
    c=0;
    #10;
    a=1;
    b=1;
    c=0;
    #10;
    a=1;
    b=1;
    c=1;
    #10;
    a=0;
    b=1;
    c=0;
    #10;
    a=0;
    b=1;
    c=1;
    #10
    a=1;
    b=0;
    c=1;
    #10
    a=0;
    b=0;
    c=1;
    #20;
    $finish();
  end

endmodule
