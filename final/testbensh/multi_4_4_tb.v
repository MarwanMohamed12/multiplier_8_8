module multi_4_4_tb();
  
  reg [3:0] a;
  reg [3:0] b;
  wire [7:0] result;
  
multiplier_4bit mul (a,b,result) ;
  initial 
   begin
    
    // Test case 1: 3 * 5 = 15
    a = 4'b1111;
    b = 4'b1111;
    #100;
    
    // Test case 2: 10 * 6 = 60
    a = 4'b1101;
    b = 4'b1000;
    #100;
    
    // Test case 3: 0 * 9 = 0
    a = 4'b1111;
    b = 4'b1101;
    #100;
    
    // Test Case 4 : 5 * 6 = 39 
    a = 4'b1100; 
    b = 4'b1001; 
    #100	
    $finish;
  end
  
endmodule
