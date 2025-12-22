`include "environment.sv"

program test(intf intff);
  environment env;
  //event g1;
  initial begin
    env=new(intff);
     #10;
    env.main();
   // @env.g1;
   
  end
endprogram
  
