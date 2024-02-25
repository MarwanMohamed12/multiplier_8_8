module mux4(
input [3:0]mux_in_a,mux_in_b,
input mux_sel,
output reg [3:0]mux_out
);

always@*
begin
if(mux_sel)
mux_out=mux_in_b;
else
mux_out=mux_in_a;
end

endmodule
