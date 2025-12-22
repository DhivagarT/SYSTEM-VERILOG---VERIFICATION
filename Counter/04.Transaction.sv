class transaction;
  //rand bit clk;
  rand bit rst;
  rand bit enb;
  bit [2:0]count;
  
  function void display(string name);
    $display("-----%0s-----",name);
    $display("Time=%0t Rst=%0d Enb=%0d Count=%0d",$time,rst,enb,count);
  endfunction
endclass  
  
