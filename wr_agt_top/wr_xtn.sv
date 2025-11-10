class write_xtn extends uvm_sequence_item;
  `uvm_object_utils(write_xtn)
  rand bit [3:0] data_in;
   rand bit load_in;
   rand bit up_down;
   rand bit  rst;
        bit [3:0] data_out;
   constraint a{ data_in inside {[0:11]}; }
   constraint VALID_LOAD {load_in dist {0:=50,1:=20};}
   constraint VALID_DIR {up_down dist {0:=50,1:=20};}
   constraint VALID_DATA {data_in inside {[0:11]};}
   constraint VALID_RESET{rst dist{0:=100,1:=1};}
   function new (string name ="write_xtn");
   super.new(name);
   endfunction
   //==============================================
   function void do_copy(uvm_object rhs);
    write_xtn rhs_;
    if(!$cast(rhs_,rhs))
    begin
      `uvm_fatal("do_copy","cast of the rhs failed")
    end
  super.do_copy(rhs);
  data_in=rhs_.data_in;
  load_in=rhs_.load_in;
  up_down=rhs_.up_down;
  rst=rhs_.rst;
   endfunction
  function bit do_compare (uvm_object rhs,uvm_comparer comparer);
   write_xtn rhs_;
    if(!$cast(rhs_,rhs))
    begin
      `uvm_fatal("do_camparer","cast of the rhs failed")
      return(0);
    end
    return super.do_compare(rhs,comparer) &&
    data_in==rhs_.data_in &&
    load_in==rhs_.load_in &&
    up_down==rhs_.up_down &&
    rst==rhs_.rst;
    endfunction
    function void do_print(uvm_printer printer);
   // super.do_print(printer);
    printer.print_field("data_in",this.data_in,4,UVM_DEC);
    printer.print_field("load_in",this.load_in,1,UVM_DEC);
    printer.print_field("up_down",this.up_down,1,UVM_DEC);
    printer.print_field("rst",this.rst,1,UVM_DEC);
    printer.print_field("data_out",this.data_out,4,UVM_DEC);
    endfunction
endclass
