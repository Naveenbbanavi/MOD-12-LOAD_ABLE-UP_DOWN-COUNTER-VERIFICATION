class write_agent_config extends uvm_object;


  `uvm_object_utils(write_agent_config)	
   virtual counter_if vif;

	//------------------------------------------
	// Data Members
	//------------------------------------------
	// Declare parameter is_active of type uvm_active_passive_enum and assign it to UVM_ACTIVE
   uvm_active_passive_enum is_active=UVM_ACTIVE;

	extern function new(string name = "write_agent_config");

endclass
//-----------------  constructor new method  -------------------//
function write_agent_config::new(string name="write_agent_config");
super.new(name);
endfunction
