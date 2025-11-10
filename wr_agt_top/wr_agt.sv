class write_agent extends uvm_agent;

   // Factory Registration
	`uvm_component_utils(write_agent)

 
        
   // Declare handles of ram_wr_monitor,ram_wr_sequencer and ram_wr_driver
	write_monitor monh;
	write_sequencer seqrh;
	write_driver drvh;
   write_agent_config m_cfg;
    function new(string name = "write_agent", 
                           uvm_component parent);
	super.new(name, parent);
endfunction
function void build_phase(uvm_phase phase);
	// Call parent build phase
	super.build_phase(phase);
   // get the config object using uvm_config_db bit
	uvm_config_db #(write_agent_config)::get(this,"","write_agent_config",m_cfg);
	// Create ram_wr_monitor instance	
		monh=write_monitor::type_id::create("monh",this);		
	// If config parameter is_active ==1 
	// Create instance of driver and sequencer
            if (m_cfg.is_active==UVM_ACTIVE)
             begin
           drvh=write_driver::type_id::create("drvh",this);
	    	seqrh=write_sequencer::type_id::create("seqrh",this);
            end
endfunction
function void connect_phase(uvm_phase phase);
                 if(m_cfg.is_active==UVM_ACTIVE)
	 drvh.seq_item_port.connect(seqrh.seq_item_export);
endfunction
endclass
