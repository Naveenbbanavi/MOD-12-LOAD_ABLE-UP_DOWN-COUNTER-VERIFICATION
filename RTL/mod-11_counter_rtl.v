module counter(input [3:0]data_in,
		       input load_in,rst,up_down,clk,
                      output reg [3:0]data_out );
                  
   always@(posedge clk)
   begin
   	if(rst)
		begin
  		 data_out <= 4'd0;
  		 end
 	else if (load_in)
       		begin
   		data_out<=data_in;
  		end  
 	else 
	begin
  	 if(up_down)  
		begin
  			if(data_out==0)
     				data_out<=4'd11;
     			else 
     				data_out<=data_out - 1'b1; 
    		end      
	 else
	 	begin
		   if (data_out==11)
 		      data_out<=4'd0;
   		   else
   		 data_out <= data_out + 1'b1;
    		end
         end
    
    end

endmodule

