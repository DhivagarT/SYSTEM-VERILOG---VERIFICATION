`include "interface.sv"
`include "test.sv"

module testbench;
  intf intff();
  test t(intff);
  
  d_flip_flop DUT(intff.dut);
  
  initial begin
    $dumpfile("Waveform.vcd");
    $dumpvars;
    
    intff.tb.clk=0;
    forever #2 intff.tb.clk=~intff.tb.clk;
    
    intff.tb.rst=1;
    #4 intff.tb.rst=0;
    
     $display("CLK=%0d",intff.tb.clk);
    
  end
  initial 
   
    #100 $finish;
  
endmodule
