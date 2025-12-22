`timescale 1ns/1ns

`include "interface.sv"
`include "test.sv"
module testbench;
  intf intff();
  test t(intff);
  
  counter DUT(.clk(intff.clk),.rst(intff.rst),.enb(intff.enb),.count(intff.count));
  initial begin
    intff.clk=0;
    forever #5 intff.clk=~intff.clk;
  end
  initial begin
    intff.rst=1;
    #6 intff.rst=0;
  end
  
  initial begin
    $dumpfile("Waveform.vcd");
    $dumpvars(0,testbench);
  end
  initial begin
    #100 $finish;
    
  end
  
endmodule

