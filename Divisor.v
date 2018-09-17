
module Counter_With_Flag_And_Parameter
#(
	// Parameter Declarations
	parameter frecuency = 100; // Frecuencia a generar expresada en Hertz 
	paraneter reference_clocck = 50_000_000; // Frecuencia de referencia expresado en Hertz
	
	parameter MAXIMUM_VALUE = 4'h8,
	parameter N_BITS = Ceil_Log2(MAXIMUM_VALUE)
)

(
	// Input Ports
	input clk,
	input reset,
	input enable,
	
	// Output Ports
	output flag,
	output[N_BITS - 1:0] counter
);

reg max_value_bit_r;

reg [N_BITS-1 : 0] counter_r;

/*********************************************************************************************/

	always@(posedge clk or negedge reset) begin
		if (reset == 1'b0)
			counter_r <= {N_BITS{1'b0}};
		else begin
				if(enable == 1'b1) begin
					if(counter_r == MAXIMUM_VALUE - 1)
						counter_r <= 1'b0;
					else
						counter_r <= counter_r + 1'b1;
						
				end
		end
	end


always@(counter_r)
	if(counter_r == MAXIMUM_VALUE - 1)
		max_value_bit_r = 1;
	else
		max_value_bit_r = 0;

		
/*********************************************************************************************/
assign flag = max_value_bit_r;
assign counter = counter_r;


/*********************************************************************************************/
/*********************************************************************************************/
   
 /*Log Function*/
     function integer Ceil_Log2;
       input integer data;
       integer i,result;
       begin
          for(i = 0; 2**i < data; i = i + 1)
             result = i + 1;
          Ceil_Log2 = result;
       end
    endfunction

/*********************************************************************************************/
endmodule
