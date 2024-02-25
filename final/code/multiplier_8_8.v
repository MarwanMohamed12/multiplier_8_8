module multiplier_8_8(
input [7:0]dataa,datab,
input start,reset_a,clk,
output done_flag,
output  [15:0]product8,
output  seg_a,seg_b,seg_c,seg_d,
	seg_e,seg_f,seg_g
);
wire [1:0]sel;
wire [3:0]aout,bout;
wire [7:0]product;
wire [1:0]shift;
wire [15:0]shift_out;
wire [15:0]sum;
wire [1:0]count;
wire [2:0]state_out;
wire sclr_n;
wire clk_ena;
mux4 mux1(.mux_in_a(dataa[3:0]),.mux_in_b(dataa[7:4]),.mux_sel(sel[1]),.mux_out(aout[3:0]));

multiplier_4bit multiplier(.a(aout),.b(bout),.result(product));

mux4 mux2(.mux_in_a(datab[3:0]),.mux_in_b(datab[7:4]),.mux_sel(sel[0]),.mux_out(bout[3:0]));

shifter shifter1(.inp(product),.shift_cntrl(shift),.shift_out(shift_out));

adder adder1(.dataa(shift_out[15:0]),.datab(product8[15:0]),.sum(sum[15:0]));

reg16 regestier(.clk(clk),.sclr_n(sclr_n),.clk_ena(clk_ena),.datain(sum[15:0]),.reg_out(product8[15:0]));

mult_control mult_control1(.clk(clk),.reset_a(reset_a),.start(start),.count(count),
.input_sel(sel),.shift_sel(shift),.state_out(state_out),.done(done_flag),.clk_ena(clk_ena),.sclr_n(sclr_n));

counter counter1(.clk(clk),.aclr_n(!start),.count_out(count));

seven_segment light(.inp(state_out[2:0]),.seg_a(seg_a),.seg_b(seg_b),.seg_c(seg_c),
.seg_d(seg_d),.seg_e(seg_e),.seg_f(seg_f),.seg_g(seg_g));



endmodule
