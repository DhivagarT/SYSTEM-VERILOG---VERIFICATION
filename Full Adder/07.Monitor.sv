class monitor;
  transact trans;
  mailbox m2;
  virtual intf vif;
  
  function new(mailbox m2,virtual intf vif);
    this.m2=m2;
    this.vif=vif;
  endfunction
  
  task main();
    repeat(3)begin
       #2;
                 
       trans=new();
      
       trans.a=vif.a;
       trans.b=vif.b;
       trans.c=vif.c;
       trans.sum=vif.sum;
       trans.carry=vif.carry;
       
        m2.put(trans);
       trans.display("Monitor Class");
       
     end
  endtask
endclass

