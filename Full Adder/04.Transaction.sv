class transact;
  rand bit a;
  rand bit b;
  rand bit c;
  bit sum;
  bit carry;
  
  function void display(string name);
    $display(name);
  $display("Time=%0t A=%0d B=%0d C=%0d Sum=%0d Carry=%0d ",
          $time,a,b,c,sum,carry);
  endfunction
  
endclass
