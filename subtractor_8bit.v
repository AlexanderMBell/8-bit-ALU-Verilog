`timescale 1ns / 1ps

module subtractor_8bit(input_1,input_2,ans);

  input[7:0] input_1,input_2;
  output[8:0] ans;
  wire[8:0] borrow_in;

  assign borrow_in[0] = 0;
  
  genvar i;
  generate
    for (i = 0; i < 8; i = i + 1) 
    begin

    full_subtractor inst (
      .input_1(input_1[i]),
      .input_2(input_2[i]),
      .borrow_in(borrow_in[i]),
      .dif(ans[i]),
      .borrow_out(borrow_in[i+1])
    );

    assign ans[8] = borrow_in[8];
      
    end
  endgenerate

endmodule
