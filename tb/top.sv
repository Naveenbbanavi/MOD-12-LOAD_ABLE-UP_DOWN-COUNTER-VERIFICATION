module top;
import test_pkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"
//virtual counter_if vif;
bit clock;
always
 #10 clock=!clock;  

	counter_if in0(clock);
   counter MOD11 (.clk        (clock),
                 .data_in    (in0.data_in),
                 .data_out   (in0.data_out),
                 .load_in (in0.load_in),
                 .up_down (in0.up_down),
                 .rst    (in0.rst)
                ); 

	initial
	begin
		
	uvm_config_db#(virtual counter_if)::set(null,"*","vif",in0);
		// Call run_test
			run_test();
	end
endmodule
     
