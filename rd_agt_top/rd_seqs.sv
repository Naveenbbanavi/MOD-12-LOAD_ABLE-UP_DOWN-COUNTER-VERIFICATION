class rd_base_seq extends uvm_sequence #(read_xtn);  
	
	// Factory registration using `uvm_object_utils

  `uvm_object_utils(rd_base_seq)  
	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
  extern function new(string name ="rd_base_seq");
endclass

//-----------------  constructor new method  -------------------//
    function ram_rbase_seq::new(string name ="rd_base_seq");
	super.new(name);
endfunction
