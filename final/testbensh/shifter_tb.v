module shifter_tb();

  reg [7:0] inp;
  reg [1:0] shift_cntrl;
  wire [15:0] shift_out;

  shifter uut 
  (
    .inp(inp),
    .shift_cntrl(shift_cntrl),
    .shift_out(shift_out)
  );

  initial begin
    $monitor("data_in = %b, shift_cntrl = %b, data_out = %b", inp, shift_cntrl, shift_out);
    
    // Test case 1: No shift
    inp = 8'b10101010;
    shift_cntrl = 2'b00;
    #10;

    // Test case 2: 4-bit shift left
    inp = 8'b10101010;
    shift_cntrl = 2'b01;
    #10;

    // Test case 3: 8-bit shift left
    inp = 8'b10101010;
    shift_cntrl = 2'b10;
    #10;

    // Test case 4: No shift
    inp = 8'b10101010;
    shift_cntrl = 2'b11;
    #10;

    // Additional test cases can be added here

    $finish;
  end

endmodule

