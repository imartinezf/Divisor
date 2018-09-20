/*********************** 
* Name:
*	Decodificador.v
* Description:
* Clock divider circuit
* From 50 MHz to 1 MHz with %50 duty cycle
* Inputs:
*	clk: Input Clock 50000000  
* Outputs:
*  flag: Clk out with 50% duty cycle
* Version:  
*	1.0
* Author: 
*	Ivan Martinez Flores & Jorge Araiza Martinez 
* Fecha: 
*	18/09/2018
***********************/
module Divisor
(
	// Input Ports
	input clk,
	// Output Ports
	output reg flag
);
	// Parameter Declarations
	parameter Frequency = 1_000_000;
	parameter Reference_Colcck = 50_000_000;
	parameter max = Reference_Colcck/(2*Frequency);
	
	reg [22:0] count;
	initial begin
	count = 0;
	flag= 0;
	end

	always@(posedge clk) begin
		if(count == (max)) begin
			flag = ~flag;
			count = 0;
	end
	else begin
		count = count +1;
	end
	end
endmodule