class write_agent_top extends uvm_env;

   // Factory Registration
	`uvm_component_utils(write_agent_top)
	// Declare a variable no_of_agents of int data type to get the configuration
    write_agent agnth;
//int num;
function new(string name = "write_agent_top" , uvm_component parent);
		super.new(name,parent);
	endfunction

function void build_phase(uvm_phase phase);
     		super.build_phase(phase);
              agnth=write_agent::type_id::create("agnth",this);
 endfunction             

  
  endclass
