`timescale 1ns / 1ps

module reg_tb();

reg clk,sclr_n,clk_ena;
  reg [15:0]datain;
  wire [15:0]reg_out;

reg16 dut(clk,sclr_n,clk_ena,datain,reg_out);

  always
   begin
    clk<=1'b1;
    #100;
    clk<=1'b0;
    #100;
   end

 initial 
 begin
  clk_ena=1'b1;
  sclr_n=1'b0;
  datain = 'h17;
  #200;
  
  clk_ena=1'b1;
  sclr_n=1'b1;
  datain ='h17;
   #200;
   
  clk_ena=1'b0;
  sclr_n=1'b0;
  datain ='h15;
   #200;
   
   clk_ena=1'b1;
     sclr_n=1'b1;
     datain ='h15;
      #200;
 end

endmodule

