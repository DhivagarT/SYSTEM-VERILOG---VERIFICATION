`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  transact trans;
  generator gen;
  driver drive;
  monitor mon;
  scoreboard score;
  
  mailbox m1;
  mailbox m2;
  
  virtual intf vif;
  
  function new(virtual intf vif);
    this.vif=vif;
    
    m1=new();
    m2=new();
    gen=new(m1);
    drive=new(m1,vif);
    mon=new(m2,vif);
    score=new(m2);
    
  endfunction
  
  task main();
    fork
      gen.main();
      drive.main();
      mon.main();
      score.main();
    join
    
  endtask
endclass
