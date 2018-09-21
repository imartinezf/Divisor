
`timescale 1ns / 1ps

module Divisor_tb;

 // Inputs
 reg clock_in;
 // Outputs
 wire flag_out;

 
Divisor
#(
	.Frequency(1_000_000), 
	.Reference_Colcck(50_000_000) 
)  
DUT 
( 
	.clk(clock_in), 
   	.flag(flag_out) 

);
/*********************************************************************************************/
 initial begin
  // Initialize Inputs
  clock_in = 0;
  // create input clock
        forever #10 clock_in = ~clock_in;  //Input clock. 
 end
/*********************************************************************************************/
//initial begin
 // Set reset
//  #20 reset_tb = 1;
//end
/*********************************************************************************************/
      
endmodule