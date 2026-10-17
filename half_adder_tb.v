`timescale 1ns / 1ps

//Half-Adder Test Bench (First Test Bench)
module ha_tb;

  //Variables
  reg a,b;
  wire c;
  wire s;

  //Instantiate
  half_adder inst1 (
    .input_1(a),
    .input_2(b),
    .c_1(c),
    .s_1(s)
  );

  //Manually Test Values
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
