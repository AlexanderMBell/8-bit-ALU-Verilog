`timescale 1ns / 1ps

//8-Bit Subtractor Module
module subtractor_8bit(input_1,input_2,ans);

  // I/O
  input[7:0] input_1,input_2;
  output[8:0] ans;

  //Variables
  wire[8:0] borrow_in;

  //Initially no borrow-in
  assign borrow_in[0] = 0;
  
  //Loop
  genvar i;
  generate
    //Transform into 8-bit
    for (i = 0; i < 8; i = i + 1) 
    begin
      //Instantiate
      full_subtractor inst (
        .input_1(input_1[i]),
        .input_2(input_2[i]),
        .borrow_in(borrow_in[i]),
        .dif(ans[i]),
        .borrow_out(borrow_in[i+1])
      );
      //9th bit used for negative or overflow indication
      assign ans[8] = borrow_in[8];
    end
  endgenerate

endmodule
