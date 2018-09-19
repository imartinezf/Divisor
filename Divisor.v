// Clock divider circuit
// From 50 MHz to 1 MHz with %50 duty cycle
 /******************************************************************* 
* Name:
*	Decodificador.v
* Description:
* 	This module is a register with parameter.
* Inputs:
*	Clk_in: Clock signal 
*  	reset: reset signal
*	 
* Outputs:
* 	Clk_out: Clk out with 50% duty cycle
* Version:  
*	1.0
* Author: 
*	Ivan Martinez Flores & Jorge Araiza Martinez 
* Fecha: 
*	18/09/2018
*********************************************************************/

module Divisor
#(// reference_clocck frequency 50MHz, frequency 1 MHz
	parameter frecuency = 1000000,
	parameter reference_clocck = 50000000,
	parameter max = frecuency / (2 * reference_clocck)
)  
(

// input ports
	input Clk_in,
	input reset,
	
// output ports
	output reg Clk_out = 1'b0
);

reg [4:0]counter = 0; // 5-bit counter size

always@(posedge Clk_in or negedge reset) begin
	if (reset == 1'b0)
		counter <= 0;	
	if (counter == max-1)
		begin
		counter <= 0;
		Clk_out <= ~Clk_out;
		end
	else
		begin
		counter <= counter + 1'd1;
		end

	end
endmodule