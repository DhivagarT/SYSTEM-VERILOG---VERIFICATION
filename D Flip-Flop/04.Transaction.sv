class transaction;
  rand bit rst;
  rand bit d;
  bit q;
  
  function void display(string name);
    $display("----%0s----",name);
    $display("Time=%0t  Rst=%0d D=%0d Q=%0d",$time,rst,d,q);
  endfunction
endclass
