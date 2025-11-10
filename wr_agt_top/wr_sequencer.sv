class write_sequencer extends uvm_sequencer #(write_xtn);

	// Factory registration using `uvm_component_utils
	`uvm_component_utils(write_sequencer)
function new(string name="wr_sequencer",uvm_component parent);
	super.new(name,parent);
endfunction
endclass
