class scoreboard #(parameter WIDTH=8);

  mailbox m2;
  bit [WIDTH-1:0] ref_q[$];

  function new(mailbox m2);
    this.m2 = m2;
  endfunction

  task main();
    transaction trans;
    bit [WIDTH-1:0] exp_data;

    repeat(15) begin
      m2.get(trans);

     //Write 
      if (trans.cs && trans.wr_enb) begin
        if (trans.full)
          $error("[SCB] Attempted WRITE when FULL!");
        else begin
          ref_q.push_back(trans.data_in);
          $display("[SCB] WRITE: %0h", trans.data_in);
        end
      end

      //Read 
      if (trans.cs && trans.rd_enb) begin
        if (trans.empty) begin
          $error("[SCB] Attempted READ when EMPTY!");
        end
        else begin
          exp_data = ref_q.pop_front();
          $display("[SCB] READ: %0h", exp_data);

          // Compare ONLY inside valid read
          if (trans.data_out === exp_data)
            $display("[SCB] PASS: READ=%0h EXP=%0h",
                     trans.data_out, exp_data);
          else
            $error("[SCB] FAIL: READ=%0h EXP=%0h",
                   trans.data_out, exp_data);
        end
      end
    end
  endtask

endclass
      
      
        
