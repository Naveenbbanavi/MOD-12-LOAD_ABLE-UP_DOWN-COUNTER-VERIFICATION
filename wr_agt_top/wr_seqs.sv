class counter_base_seq extends uvm_sequence #(write_xtn);  
	
  // Factory registration using `uvm_object_utils

	`uvm_object_utils(counter_base_seq)  
	//------------------------------------------
	// METHODS
	//------------------------------------------
write_xtn wrh;
	// Standard UVM Methods:
 function new(string name ="counter_base_seq");
	super.new(name);
endfunction

	task body();
	 
	repeat(5)

	begin 
		 wrh=write_xtn::type_id::create("wrh");
		 start_item(wrh);
		 if(wrh.randomize())
		 $display("randomize sucess");
	     else 
		  $display("randomize failed");
		 finish_item(wrh);
	end
	endtask

endclass
