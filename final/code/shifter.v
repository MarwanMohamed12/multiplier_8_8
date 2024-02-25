module shifter(
input [7:0]inp,
input [1:0]shift_cntrl,
output reg [15:0]shift_out
);
reg [15:0]var;
always@(inp,shift_cntrl)
begin
case(shift_cntrl)
2'b00:
begin
var={8'b0,inp};
shift_out=var; end
2'b01:
begin
var={8'b0,inp};
shift_out=var<<4; end
2'b10:
begin
var={8'b0,inp};
shift_out=var<<8; end
2'b11:
begin
var={8'b0,inp};
shift_out=var; end
default:
begin
shift_out={8'b0,inp}; end
endcase

end
endmodule
