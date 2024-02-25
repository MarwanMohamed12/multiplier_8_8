module counter(
input clk,aclr_n,
output reg [1:0]count_out
);

always@(posedge clk,negedge aclr_n)
begin
if(~aclr_n)
count_out='b0;
else
count_out=count_out+1;
end


endmodule
