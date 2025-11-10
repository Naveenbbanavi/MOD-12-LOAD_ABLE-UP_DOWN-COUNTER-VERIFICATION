interface counter_if(input bit clock);
   
   logic [3:0] data_in;
   logic [3:0] data_out;
   logic load_in;
   logic up_down;
   logic  rst;


   //Write Driver clocking block
   clocking wr_drv_cb@(negedge clock);
      default input #1 output #0;
      output rst;
      output data_in;
      output load_in;
      output up_down;
   endclocking: wr_drv_cb
 
   
   //Write monitor clocking block
   clocking wr_mon_cb@(posedge clock);
      default input #1 output #0;
      input rst;
      input data_in;
      input load_in;
      input up_down;
   endclocking: wr_mon_cb
   
   //Read monitor clocking block
   clocking rd_mon_cb@(posedge clock);
      default input #1 output #0;
      //input read;
      //input rd_address;
      input data_out;
   endclocking: rd_mon_cb

   //Write Driver modport
   modport WR_DRV_MP (clocking wr_drv_cb);

   
   //Write Monitor modport
   modport WR_MON_MP (clocking wr_mon_cb);

   //Read Monitor modport
   modport RD_MON_MP (clocking rd_mon_cb);
    

endinterface
