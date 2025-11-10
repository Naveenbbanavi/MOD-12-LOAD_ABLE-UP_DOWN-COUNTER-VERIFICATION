class read_agent_top extends uvm_env;

	// Factory Registration
	`uvm_component_utils(read_agent_top)
    
  
    read_agent agnth;
	

//-----------------  constructor new method  -------------------//
// Define Constructor new() function
function new(string name = "read_agent_top" , uvm_component parent);
	super.new(name,parent);
endfunction

    
//-----------------  build() phase method  -------------------//
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	// Create the instance of ram_rd_agent
   	agnth=read_agent::type_id::create("agnth",this);
endfunction
endclass
