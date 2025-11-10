class write_driver extends uvm_driver #(write_xtn);
`uvm_component_utils(write_driver)
write_agent_config m_cfg;

virtual counter_if.WR_DRV_MP vif;

function new(string name ="write_driver",uvm_component parent);
	super.new(name,parent);
endfunction


function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(write_agent_config)::get(this,"","write_agent_config",m_cfg))
 `uvm_fatal("CONFG","getting config failed")
endfunction

function void connect_phase(uvm_phase phase);
vif=m_cfg.vif;
endfunction

task run_phase(uvm_phase phase);
super.run_phase(phase);
  // `uvm_info(get_type_name(), "This is Driver run phase", UVM_MEDIUM)
  @(vif.wr_drv_cb);
  vif.wr_drv_cb.rst<=1;
  @(vif.wr_drv_cb);
  //@(vif.wr_drv_cb);
  vif.wr_drv_cb.rst<=0;
 //   @(vif.wr_drv_cb);

  
  forever 
   begin
	  seq_item_port.get_next_item(req);
	  send_to_dut(req);
	  seq_item_port.item_done();
   end
endtask 

task send_to_dut(write_xtn xtn);
  
//repeat(2)
   // @(vif.wr_drv_cb);

	 vif.wr_drv_cb.data_in<=xtn.data_in;
	 vif.wr_drv_cb.load_in<=xtn.load_in;
	 vif.wr_drv_cb.up_down<=xtn.up_down;
	 
   // @(vif.wr_drv_cb);
 `uvm_info("WR_DRIVER",$sformatf("printing from driver \n %s", xtn.sprint()),UVM_LOW) 
  @(vif.wr_drv_cb);

	endtask
 endclass
