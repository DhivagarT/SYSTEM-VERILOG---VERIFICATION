class monitor;
  virtual intf vif;
  mailbox m2;
  
  function new(virtual intf vif,mailbox m2);
    this.vif=vif;
    this.m2=m2;
    
  endfunction
  
  task main();
     transaction trans;
    repeat(3)begin
      //#2;
     
      trans=new();
      @(posedge vif.clk);
      #1;
      trans.rst=vif.rst;
      trans.d=vif.d;
      trans.q=vif.q;
      
      m2.put(trans);
      
      trans.display("Monitor Class");
      
      
    end
  endtask
endclass
      
