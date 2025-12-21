`include "interface.sv"
`include "test.sv"
  
module testbench;
  intf intff();
  test t(intff);
  
  Full_Adder DUT(.a(intff.a),.b(intff.b),.c(intff.c),.sum(intff.sum),.carry(intff.carry));
  
  initial begin
    $dumpfile("Waveform.vcd");
    $dumpvars(0,testbench);
  end
endmodule
