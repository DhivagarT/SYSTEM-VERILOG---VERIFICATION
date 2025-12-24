class monitor;
  transaction trans;
  mailbox m2;
  virtual intf vif;
  
  function new(mailbox m2,virtual intf vif);
    this.m2=m2;
    this.vif=vif;
  endfunction
  
  task main();
    repeat(15)begin
      trans=new();
      #2;
      @(posedge vif.clk or negedge vif.rst);
      
      trans.rst=vif.rst;
      trans.cs=vif.cs;
      trans.wr_enb=vif.wr_enb;
      trans.rd_enb=vif.rd_enb;
      trans.data_in=vif.data_in;
      trans.data_out=vif.data_out;
      trans.full=vif.full;
      trans.empty=vif.empty;
      
      m2.put(trans);
      trans.display("MONITOR CLASS");
    end
  endtask
endclass
    
