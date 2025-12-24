class driver;
  transaction trans;
  mailbox m1;
  virtual intf vif;
  
  function new(mailbox m1,virtual intf vif);
    this.m1=m1;
    this.vif=vif;
  endfunction
  
  task main();
    repeat(15)begin
      m1.get(trans);
      
      vif.rst<=trans.rst;
      vif.cs<=trans.cs;
      vif.wr_enb<=trans.wr_enb;
      vif.rd_enb<=trans.rd_enb;
      vif.data_in<=trans.data_in;
      @(posedge vif.clk or negedge vif.rst);
      trans.display("DRIVER CLASS");
      #2;
    end
  endtask
endclass
    

    
