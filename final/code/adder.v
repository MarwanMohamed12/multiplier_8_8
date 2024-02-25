module adder(
input [15:0]dataa,datab,
output  reg[15:0]sum
);


always@*
begin
sum=dataa+datab;
end
endmodule

