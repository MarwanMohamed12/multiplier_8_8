module seven_segment(
input [2:0]inp,
output reg seg_a,seg_b,seg_c,seg_d,
	seg_e,seg_f,seg_g
);

always@*
begin
case(inp)
3'b000:begin {seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g}=7'b1111110; end
3'b001:begin{seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g}=7'b0110000;end
3'b010:begin{seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g}=7'b1101101;end
3'b011:begin{seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g}=7'b1111001;end
3'b100:begin{seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g}=7'b0110011;end
3'b101:begin{seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g}=7'b1011011;end
3'b110:begin{seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g}=7'b1011111;end
3'b111:begin{seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g}=7'b1110000;end
default:begin{seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g}=7'b1001111;end
endcase

end

endmodule
