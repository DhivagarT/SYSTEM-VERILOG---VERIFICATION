class generator;
  transaction trans;
  mailbox m1;
  
  function new(mailbox m1);
    this.m1=m1;
  endfunction
  
  task main();
    repeat(15)begin
    trans=new();
      trans.randomize();
      trans.rst=1;
      trans.cs=1;
      m1.put(trans);
      trans.display("GENERATOR CLASS");
    end
  endtask
endclass
