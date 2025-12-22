class monitor;
//   transaction trans;
  virtual intf vif;
  mailbox m2;
  
  function new(virtual intf vif,mailbox m2);
    this.vif=vif;
    this.m2=m2;
  endfunction
  
  task main();
    
    repeat(5)begin
      //#2;
    transaction trans;
    trans=new();
      
      @(posedge vif.clk);
        //trans.clk<=vif.clk;
        trans.rst=vif.rst;
        trans.enb=vif.enb;
        #1;
        trans.count=vif.count;
        m2.put(trans);
    
//     trans.clk=vif.clk;
//     trans.rst=vif.rst;
//     trans.count=vif.count;
      trans.display("Monitor Class");
        
    
     
    end
  endtask
endclass
