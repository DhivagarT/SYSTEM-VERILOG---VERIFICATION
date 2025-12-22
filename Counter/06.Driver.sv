class driver;
  //transcator trans;
  virtual intf vif;
  mailbox m1;
  
  function new(virtual intf vif,mailbox m1);
    this.vif=vif;
    this.m1=m1;
  endfunction
  
  task main();
    repeat(5)begin
      
      transaction trans;
      m1.get(trans);
      //vif.clk <= trans.clk;
      
      vif.rst <= trans.rst;
      vif.enb <= trans.enb;
      @(posedge vif.clk);
      trans.display("Driver Class");
      #1;
    end
  endtask
endclass
     
  
