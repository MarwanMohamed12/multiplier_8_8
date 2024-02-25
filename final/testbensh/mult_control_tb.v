module mult_control_tb();
reg clk,reset_a,start;
reg [1:0]count;
wire  done,clk_ena,sclr_n;
wire [1:0]input_sel,shift_sel;
wire   [2:0]state_out;

mult_control as(.clk(clk),.reset_a(reset_a),.start(start),.count(count),
.done(done),.clk_ena(clk_ena),.sclr_n(sclr_n),.input_sel(input_sel),
.shift_sel(shift_sel),.state_out(state_out));
localparam T=20;
always
begin
clk=1'b1;
#(T/2);
clk=1'b0;
#(T/2);
end

initial begin
reset_a=1'b0;
start=1'b0;
count=2'b00;
#(T);
reset_a=1'b0;
start=1'b0;
count=2'b01;
#(T);
//idle
reset_a=1'b1;
start=1'b1;
count=2'b00;
#(T);
//lsb
start=1'b0;
count=2'b00;
#(T);
//mid
start=1'b0;
count=2'b10;
#(T);
//msb
start=1'b0;
count=2'b11;
#(T);
//clc
start=1'b0;
count=2'b11;
#(T);
//idle
start=1'b1;
count=2'b00;
#(T);
//lsb
start=1'b1;
count=2'b00;
#(T);
end
endmodule