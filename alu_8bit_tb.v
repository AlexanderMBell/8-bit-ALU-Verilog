`timescale 1ns / 1ps

module alu_8bit_tb;

  reg[7:0] a,b;
  wire[7:0] r;
  reg[2:0] opt;
  wire Z,N,C,V;

  integer i,j,err;
  reg[7:0] expec;

  alu_8bit inst1 (.input_1(a),.input_2(b),.opt(opt),.result(r),.Z(Z),.N(N),.C(C),.V(V));

  //Verify addition cases
  initial begin

    //Addition Cases
    err = 0;
    opt = 3'b000;

    for (i = 0; i < 256; i = i + 1) begin
      for(j = 0; j < 256; j = j + 1) begin

        a = i;
        b = j;
        expec = a + b;
        #1;

        if (r !== expec) begin
          err = err + 1;
          $display("Addition Error at a=%b, b=%b",a,b);
        end
      end
    end
    $display("%0d addition errors",err);

    //Subtraction Cases
    err = 0;
    opt = 3'b001;

    for (i = 0; i < 256; i = i + 1) begin
      for(j = 0; j < 256; j = j + 1) begin

        a = i;
        b = j;
        expec = a - b;
        #1;

        if (r !== expec) begin
          err = err + 1;
          $display("Subtraction Error at a=%b, b=%b",a,b);
        end
      end
    end
    $display("%0d subtracton errors",err);

    //And Cases
    err = 0;
    opt = 3'b010;

    for (i = 0; i < 128; i = i + 1) begin
      for(j = 0; j < 128; j = j + 1) begin

        a = i;
        b = j;
        expec = a & b;
        #1;

        if (r !== expec) begin
          err = err + 1;
          $display("And Error at a=%b, b=%b",a,b);
        end
      end
    end
    $display("%0d And errors",err);

    //Or Cases
    err = 0;
    opt = 3'b011;

    for (i = 0; i < 128; i = i + 1) begin
      for(j = 0; j < 128; j = j + 1) begin

        a = i;
        b = j;
        expec = a | b;
        #1;

        if (r !== expec) begin
          err = err + 1;
          $display("Or Error at a=%b, b=%b",a,b);
        end
      end
    end
    $display("%0d Or errors",err);

    //XOR Cases
    err = 0;
    opt = 3'b111;

    for (i = 0; i < 128; i = i + 1) begin
      for(j = 0; j < 128; j = j + 1) begin

        a = i;
        b = j;
        expec = a ^ b;
        #1;

        if (r !== expec) begin
          err = err + 1;
          $display("XOR Error at a=%b, b=%b",a,b);
        end
      end
    end
    $display("%0d XOR errors",err);
    $finish();

  end
endmodule
