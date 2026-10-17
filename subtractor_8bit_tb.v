`timescale 1ns / 1ps

//8-Bit Subtractor Test Bench
module subtractor_8bit_tb;

  //Variables
  reg[7:0] a,b;
  wire[8:0] ans;

  //Instantiate
  subtractor_8bit inst (
    .input_1(a),
    .input_2(b),
    .ans(ans)
  );
  
  //Manually Test Values
  initial begin
    $monitor("a=%b,b=%b,ans=%b",a,b,ans);
    a = 8'b00000101; 
    b = 8'b00000011;
    #10;
    a = 8'b00000011; 
    b = 8'b00000101;
    #10;
    a = 8'b00000000; 
    b = 8'b00000001;
    #10;
    a = 8'b00000000; 
    b = 8'b11001000;
    #10;
    a = 8'b11111111; 
    b = 8'b11111111;
    #10;
    $finish();
  end
  
endmodule
