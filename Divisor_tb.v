
`timescale 1ns / 1ps

module Divisor_tb;

 // Inputs
 reg clock_in;
 reg reset_tb;
 // Outputs
 wire clock_out;

 
Divisor
#(
	.frecuency(50000000), 
	.reference_clocck(1000000) 
)  
DUT 
( 
	.Clk_in(clock_in), 
	.reset(reset_tb),
   	.Clk_out(clock_out) 

);
/*********************************************************************************************/
 initial begin
  // Initialize Inputs
  clock_in = 0;
  // create input clock
        forever #10 clock_in = ~clock_in;  //Input clock. 
 end
/*********************************************************************************************/
initial begin
 // Set reset
  #20 reset_tb = 1;
end
/*********************************************************************************************/
      
endmodule