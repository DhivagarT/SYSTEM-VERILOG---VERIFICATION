class scoreboard;
  //transact trans;
  mailbox m2;
  function new(mailbox m2);
    this.m2=m2;
  endfunction
  
  task main();
    repeat(3)
    begin
      transact trans;
      m2.get(trans);
       trans.display("Scoreboard Class");
      
      if(((trans.a^trans.b^trans.c)==trans.sum)&&
         ((trans.a&trans.b)|(trans.b&trans.c)|(trans.c&trans.a)==trans.carry))
        $display("----PASS----");
      else
        $display("----FAIL----");
      //trans=new();
     
    end
  endtask
endclass

     
