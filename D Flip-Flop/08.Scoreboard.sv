class scoreboard;
  mailbox m2;
  bit exp_q;
  bit prev_d;   // store previous D

  function new(mailbox m2);
    this.m2 = m2;
    prev_d = 0;
  endfunction

  task main();
    transaction trans;
    repeat(3) begin
      m2.get(trans);

      if (trans.rst)
        exp_q = 0;
      else
        exp_q = prev_d;  

      if (exp_q == trans.q)
        $display("---PASS---");
      else
        $display("----FAIL----");

      prev_d = trans.d;   // update for next cycle

      trans.display("Scoreboard Class");
    end
  endtask
endclass
