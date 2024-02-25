# multiplier_8_8
implementing multiplier with other blocks like
1-adder 
2-4*4 multiplier
3-multiplexr
4-multi_control
5-seven segment 
6-register 
The input to the multiplier consists of two 8-bit multiplicands (dataa and datab) and the output from the multiplier is 16-bit product (product8x8_out). Additional outputs are a done bit (done_flag) and seven signals to drive a 7 segment display (seg_a, seg_b, seg_c, seg_d, seg_e, seg_f & seg_g).

This 8 x 8 multiplier requires four clock cycles to perform the full multiplication. During each  
cycle, a pair of 4-bit portion of the multiplicands is multiplied by a 4 x 4 multiplier. The  
multiplication result of these 4-bit slices is then accumulated. At the end of the four cycles  
(during the 5th cycle), the fully composed 16-bit product can be read at the output. The  
following equations illustrate the mathematical principles supporting this implementation:

![photo_5969642613592146424_y](https://github.com/MarwanMohamed12/multiplier_8_8/assets/138940689/c595f8f5-65e0-4c6f-982b-2103535d4cc2)

