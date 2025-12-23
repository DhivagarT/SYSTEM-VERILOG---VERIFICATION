class driver;
  virtual intf vif;
  mailbox m1;
  
  function new(virtual intf vif,mailbox m1);
    this.vif=vif;
    this.m1=m1;
  endfunction
  
  task main();
    transaction trans;
    repeat(3)begin
      
      m1.get(trans);
      @(posedge vif.clk);
      vif.rst<=trans.rst;
      vif.d<=trans.d;
      
      trans.display("Driver Class");
      //#2;
      
    end
  endtask
endclass
