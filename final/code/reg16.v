module reg16(
input [15:0]datain,
input clk,sclr_n,clk_ena,
output reg [15:0]reg_out
);


always@(posedge clk)
begin
if(clk_ena==1'b1&&sclr_n==1'b0)
reg_out<='b0;
else if(clk_ena==1'b1&&sclr_n==1'b1)
reg_out<=datain;
else 
reg_out<=reg_out;
end


endmodule
