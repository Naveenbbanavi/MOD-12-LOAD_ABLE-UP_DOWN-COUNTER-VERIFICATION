class read_sequencer extends uvm_sequencer #(read_xtn);

	// Factory registration using `uvm_component_utils
	`uvm_component_utils(read_sequencer)

	

function new(string name="read_sequencer",uvm_component parent);
	super.new(name,parent);
endfunction
endclass
