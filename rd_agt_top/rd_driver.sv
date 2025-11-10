class read_driver extends uvm_driver #(read_xtn);

	// Factory Registration

	`uvm_component_utils(read_driver)

 function  new(string name="read_driver",uvm_component parent);
super.new(name,parent);
endfunction


//-----------------  build() phase method  -------------------//
function void build_phase(uvm_phase phase);
super.build_phase(phase);	
endfunction
endclass
