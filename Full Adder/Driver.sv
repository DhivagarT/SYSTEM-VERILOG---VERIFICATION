class driver;
  
  mailbox m1;
  virtual intf vif;
  
  function new(mailbox m1,virtual intf vif);
    this.m1=m1;
    this.vif=vif;
  endfunction
  
  task main();
    repeat(3)
      begin
      transact trans;
      
      m1.get(trans);
      vif.a<=trans.a;
      vif.b<=trans.b;
      vif.c<=trans.c;
      #2;
      //trans=new();
      trans.display("Driver Class");
    end
  endtask
endclass
  
    
