class read_agent_config extends uvm_object;
	// UVM Factory Registration Macro
`uvm_object_utils(read_agent_config)
	// Declare the virtual interface handle for ram_if as "vif"
virtual counter_if vif;
uvm_active_passive_enum is_active=UVM_PASSIVE;
//-----------------  constructor new method  -------------------//
function new(string name="read_agent_config");
super.new(name);
endfunction
endclass
