class read_monitor extends uvm_monitor;

	// Factory Registration
`uvm_component_utils(read_monitor)
virtual counter_if.RD_MON_MP vif;
read_agent_config m_cfg;
uvm_analysis_port#(write_xtn) monitor_rd;
//-----------------  constructor new method  -------------------//
function  new(string name ="read_monitor",uvm_component parent);
super.new(name,parent);
monitor_rd=new("monitor_rd",this);
endfunction 


 function void build_phase(uvm_phase phase);
   //super.build_phase(phase);
   super.build_phase(phase);
   uvm_config_db#(read_agent_config)::get(this,"","read_agent_config",m_cfg);
 endfunction
function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
vif=m_cfg.vif;
endfunction
//-----------------  run() phase method  -------------------//
task run_phase(uvm_phase phase);
  @(vif.rd_mon_cb);
  @(vif.rd_mon_cb);
  @(vif.rd_mon_cb);
   forever
  collect_data();
endtask
task collect_data(); 
 write_xtn data_sent;
   data_sent=write_xtn::type_id::create("data_sent");
   data_sent.data_out = vif.rd_mon_cb.data_out;
  `uvm_info("RD_MONITOR",$sformatf("printing from monitor \n %s", data_sent.sprint()),UVM_LOW);
   monitor_rd.write(data_sent);
   @(vif.rd_mon_cb);
 endtask
 endclass  
    
