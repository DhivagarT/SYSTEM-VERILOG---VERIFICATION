class transaction #(parameter WIDTH=8,DEPTH=32);
  bit rst;
  bit cs;
  rand bit wr_enb;
  rand bit rd_enb;
  rand bit [WIDTH-1:0]data_in;
  bit [WIDTH-1:0]data_out;
  bit full;
  bit empty;
  
  function void display(string name);
  $display("-----%0s-----",name);
    $display("[%0t]  | RST=%0d | CS=%0d | WR_ENB=%0d | RD_ENB=%0d DATA_IN=%0d | DATA_OUT=%0d FULL=%0d |  EMPTY=%0d",$time,rst,cs,wr_enb,rd_enb,data_in,data_out,full,empty);
  endfunction
endclass
