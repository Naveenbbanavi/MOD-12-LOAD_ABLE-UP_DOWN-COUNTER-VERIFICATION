class write_monitor extends uvm_monitor;
`uvm_component_utils(write_monitor)

virtual counter_if.WR_MON_MP vif;

write_agent_config m_cfg;
uvm_analysis_port#(write_xtn) monitor_port;
function new(string name = "write_monitor", uvm_component parent);
super.new(name,parent);
monitor_port=new("monitor_port",this);
endfunction


function void build_phase(uvm_phase phase);
super.build_phase(phase);
uvm_config_db#(write_agent_config)::get(this,"","write_agent_config",m_cfg);
endfunction


function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
vif=m_cfg.vif;
endfunction

task run_phase(uvm_phase phase);
//	`uvm_info(get_type_name(),"THIS IS MONITOR IN RUN",UVM_LOW)
	forever
            collect_data();   
endtask

task collect_data();
begin
write_xtn data_send;
data_send=write_xtn::type_id::create("data_send");
     wait(vif.wr_mon_cb.rst==0);

       data_send.rst =  vif.wr_mon_cb.rst;
        data_send.load_in= vif.wr_mon_cb.load_in;
        data_send.up_down =  vif.wr_mon_cb.up_down;
        data_send.data_in= vif.wr_mon_cb.data_in;


`uvm_info("WR_MONITOR",$sformatf("printing from monitor \n %s", data_send.sprint()),UVM_LOW);
monitor_port.write(data_send);
 @(vif.wr_mon_cb);
 
end

endtask

	
endclass 
