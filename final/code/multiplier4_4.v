module multiplier_4bit(
  input [3:0] a,
  input [3:0] b,
  output [7:0] result
);

  reg [7:0] mult_result;
  reg [7:0] partial_product;
  reg [3:0] shift_count;

  always @(*) begin
    partial_product = 0;
    shift_count = 0;

    // Perform multiplication using addition and shifting
    for (shift_count = 0; shift_count < 4; shift_count = shift_count + 1) 
    begin
      if (b[shift_count] == 1)
        partial_product = partial_product + (a << shift_count);
    end

    mult_result = partial_product;
  end

  assign result = mult_result;

endmodule
