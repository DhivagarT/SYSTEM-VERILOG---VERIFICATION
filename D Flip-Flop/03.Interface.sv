interface intf;
  logic clk;
  logic rst;
  logic d;
  logic q;
  
  modport dut(input clk,rst,d,output q);
  modport tb(input q,output clk,rst,d);
  
endinterface
