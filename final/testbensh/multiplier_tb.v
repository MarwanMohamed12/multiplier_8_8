`timescale 1ns/1ps;
module multiplier_tb();
reg [7:0]dataa,datab;
reg start,reset_a,clk;
wire done_flag;
wire  [15:0]product8;
wire  seg_a,seg_b,seg_c,seg_d,
	seg_e,seg_f,seg_g;

multiplier_8_8 aaa(.dataa(dataa),.datab(datab),.start(start),.reset_a(reset_a),
.clk(clk),.done_flag(done_flag),.product8(product8),.seg_a(seg_a),.seg_b(seg_b),
.seg_c(seg_c),.seg_d(seg_d),.seg_e(seg_e),.seg_f(seg_f),.seg_g(seg_g));
localparam T=100;
always
begin
clk=1'b1;
#(T/2);
clk=1'b0;
#(T/2);
end

initial begin
clk=1'b0;
reset_a=1'b0;
start=1'b0;
dataa=8'b11111111;//255
datab=8'b11111111;//255
#(75);
reset_a=1'b1;
start=1'b1;
#(30);
start=1'b0;
#(5*T)
clk=1'b0;
reset_a=1'b0;
start=1'b0;
dataa=8'b00001010;//10
datab=8'b00011110;//30
#(75);
reset_a=1'b1;
start=1'b1;
#(30);
start=1'b0;

end
endmodule
