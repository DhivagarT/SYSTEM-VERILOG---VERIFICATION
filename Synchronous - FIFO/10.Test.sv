`include "environment.sv"

program test(intf intff);
  environment env;
  
  initial begin
    env=new(intff);
    env.main();
    #10;
  end
endprogram
      
  
  
