class read_agent extends uvm_agent;

   // Factory Registration
	`uvm_component_utils(read_agent)

   // Declare handle for configuration object
        read_agent_config m_rd_cfg;
       
   // Declare handles of ram_rd_monitor,ram_rd_sequencer and ram_rd_driver
	read_monitor monh;
	read_sequencer seqrh;
	read_driver drvh;

	

function new(string name = "ram_rd_agent", 
                           uvm_component parent = null);
	super.new(name, parent);
endfunction
     
  
//-----------------  build() phase method  -------------------//
// Call parent build phase
// Create rd_monitor instance
// If is_active=UVM_ACTIVE, create rd_driver and rd_sequencer instances
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
    // get the config object using uvm_config_db
	if(!uvm_config_db #(read_agent_config)::get(this,"","read_agent_config",m_rd_cfg))
	`uvm_fatal("CONFIG","cannot get() m_cfg from uvm_config_db. Have you set() it?")  
    monh=read_monitor::type_id::create("monh",this);	
	if(m_rd_cfg.is_active==UVM_ACTIVE)
		begin
			drvh=read_driver::type_id::create("drvh",this);
			seqrh=read_sequencer::type_id::create("seqrh",this);
		end
endfunction

      
//-----------------  connect() phase method  -------------------//
//If is_active=UVM_ACTIVE, 
//connect driver(TLM seq_item_port) and sequencer(TLM seq_item_export)
      
function void connect_phase(uvm_phase phase);
	if(m_rd_cfg.is_active==UVM_ACTIVE)
		begin
			drvh.seq_item_port.connect(seqrh.seq_item_export);
		end
endfunction
endclass
