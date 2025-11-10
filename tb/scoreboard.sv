class sb extends uvm_scoreboard;

`uvm_component_utils(sb);

uvm_tlm_analysis_fifo#(write_xtn) fifo_wr;
uvm_tlm_analysis_fifo#(write_xtn)  fifo_rd;

write_xtn wr_data,rd_data;
static bit[3:0] data_out_sb;

function new (string name="sb",uvm_component parent);
super.new(name,parent);
fifo_wr=new("fifo_wr",this);
fifo_rd=new("fifo_rd",this);
//cg=new();
endfunction

task run_phase(uvm_phase phase);
//`uvm_info(get_name(),"tihis is sb run_phase",UVM_LOW);
super.run_phase(phase);
//wr_data=write_xtn::type_id::create("wr_data");
fork
    begin
      forever
        begin
//	$display("hi");
	//`uvm_info(get_name(),"this is sb run_phase",UVM_LOW);
    fifo_wr.get(wr_data);
	//`uvm_info(get_name(),"getting data",UVM_LOW);
	//wr_data.print();
    counter(wr_data);
	//cg.sample();   
      end
    end
    begin
    forever
      begin
         fifo_rd.get(rd_data);
		 //rd_data.print();
        check_data(rd_data);
		//cg.sample();
    end
   // end
  end

join
endtask


task counter(write_xtn refs);
$display("hiii");
begin
    if(refs.rst)
		begin
  		 data_out_sb <= 4'd0;
  		 end
 	else if (refs.load_in)
       		begin
   		data_out_sb<=refs.data_in;
  		end 
     else 
	begin
  	 if(refs.up_down)  
		begin
  			if(data_out_sb==0)
     				data_out_sb<=4'd11;
     			else 
     				data_out_sb<=data_out_sb - 1'b1; 
    		end      
	 else
	 	begin
		   if (data_out_sb==11)
 		      data_out_sb<=4'd0;
   		   else
   		 data_out_sb <= data_out_sb + 1'b1;
    		end
   end
  end
endtask

 
task check_data(write_xtn data);
begin
if(data.data_out==data_out_sb)
   `uvm_info(get_name(),"DATA MATCHED",UVM_LOW)
else
 `uvm_info(get_name(),"DATA  NOT MATCHED",UVM_LOW)


end
endtask

covergroup cg;
	DATA_in: coverpoint wr_data.data_in{
		  bins data ={[0:11]};
		  }
    RESET: coverpoint wr_data.rst{
		bins RST={[0:1]};
	}
endgroup
endclass
