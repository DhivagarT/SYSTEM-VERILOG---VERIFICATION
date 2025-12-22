class generator;
  transaction trans;
  mailbox m1;
  
  function new(mailbox m1);
    this.m1=m1;
  endfunction 
  
  task main();
    repeat(5)begin
    trans=new();
      trans.randomize();
      trans.display("Generator Class");
      m1.put(trans);
    end
  endtask
endclass
    
