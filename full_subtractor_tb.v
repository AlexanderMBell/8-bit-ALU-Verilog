`timescale 1ns / 1ps

//Full-Subtractor Test Bench
module full_subtractor_tb;

  //Variables
  reg a,b,c;
  wire ans,d;

  //Instantiate
  full_subtractor inst (
    .input_1(a),
    .input_2(b),
    .borrow_in(c),
    .dif(ans),
    .borrow_out(d)
  );

  //Manually Test Values
  initial begin
    $monitor("a=%b,b=%b,c=%b,ans=%b,d=%b",a,b,c,ans,d);
    a = 1; 
    b = 0; 
    c = 0;
    #10;
    a = 0; 
    b = 1; 
    c = 0;
    #10;
    a = 0; 
    b = 0; 
    c = 1;
    #10;
    $finish();
  end
  
endmodule
