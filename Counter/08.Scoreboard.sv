class scoreboard;
  mailbox m2;
  bit [2:0] exp_count;

  function new(mailbox m2);
    this.m2 = m2;
    exp_count = 0;
  endfunction

  task main();
    repeat (5) begin
      transaction trans;
      m2.get(trans);

      // GOLDEN MODEL (no clock!)
      if (trans.rst)
        exp_count = 0;
      else if(trans.enb)
        exp_count = exp_count + 1;
      else if(!trans.enb)
        exp_count = exp_count - 1;

      // COMPARISON
      if (exp_count === trans.count)
        $display("PASS : exp=%0d dut=%0d", exp_count, trans.count);
      else
        $display("FAIL : exp=%0d dut=%0d", exp_count, trans.count);
    end
  endtask
endclass

         
        
               
          
        
      
