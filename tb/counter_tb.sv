class counter_tb extends uvm_env;
	`uvm_component_utils(counter_tb);
  
     write_agent_top wr_agt_h;
     read_agent_top  rd_agt_h;
     env_config      m_cfg;
     sb              sbh;
  write_agent_config m_wr_cfg;
  read_agent_config m_rd_cfg;
  function new(string name="counter_tb",uvm_component parent);
  super.new(name,parent);
  endfunction


  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
   // m_cfg=env_config::type_id::create("m_cfg");
    uvm_config_db#(env_config)::get(this,"","env_config",m_cfg);
   if(m_cfg.has_wagent==1)
       begin
          uvm_config_db#(write_agent_config)::set(this,"wr_agt_h*","write_agent_config",m_cfg.wr_cfg);	
	        wr_agt_h=write_agent_top::type_id::create("wr_agt_h",this);
        end


   if(m_cfg.has_ragent==1)
      begin
       uvm_config_db#(read_agent_config)::set(this,"rd_agt_h*","read_agent_config",m_cfg.rd_cfg);	
       rd_agt_h=read_agent_top::type_id::create("rd_agt_h",this);
      end

    if(m_cfg.has_scoreboard==1)
      sbh=sb::type_id::create("sbh",this);
    
  endfunction

  function void connect_phase(uvm_phase phase);
  super.connect_phase(phase);
   wr_agt_h.agnth.monh.monitor_port.connect(sbh.fifo_wr.analysis_export);
   rd_agt_h.agnth.monh.monitor_rd.connect(sbh.fifo_rd.analysis_export);
  endfunction
endclass

