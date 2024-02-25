`timescale 1ns / 1ps

module adder_tb();
 
 reg [15:0]a,b;
 wire [15:0]sum;
 
 adder q(a,b,sum);
  initial
  begin 
    a= $random ; b = $random; 
    #200;
    a=$random; b= $random; 
    #200;
    a=$random; b=$random; 
    #200;
    a=$random; b=$random; 
    #200;
    a=$random; b=$random; 
    #200;
    a=$random; b=$random; 
    #200;
end
  

endmodule
