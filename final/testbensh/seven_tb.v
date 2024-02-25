`timescale 1ns / 1ps

module segment_tb;
  reg [2:0] binary;
  wire seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g;
  
  seven_segment a(binary,seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g);
  initial 
  begin
    $monitor("input=%b output=%b output=%b output=%b output=%b output=%b output=%b output=%b",binary,seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g);
    binary=3'b000;
    #100;
    binary=3'b001;
    #100;
    binary=3'b010;
    #100;
    binary=3'b011;
    #100;
    binary=3'b100;
    #50;
    binary=3'b101;
    #50;
    $finish;
    end
    
    endmodule
