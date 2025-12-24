`include "interface.sv"
`include "test.sv"

module testbench;
  
  intf intff();
  test t(intff);
  
  synchronous_fifo #(.WIDTH(intff.WIDTH),
                     .DEPTH(intff.DEPTH))
                    DUT(.clk(intff.clk),
                        .rst(intff.rst),
                        .cs(intff.cs),
                        .wr_enb(intff.wr_enb),
                        .rd_enb(intff.rd_enb),
                        .data_in(intff.data_in),
                        .data_out(intff.data_out),
                        .full(intff.full),
                        .empty(intff.empty));
  
  initial begin
    intff.clk=0;
    forever #5 intff.clk=~intff.clk;
   
  end
  initial begin
    intff.rst=0;
    #10 intff.rst=1;
  end
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars;
  end
  initial begin 
    intff.cs=0;
    #2 intff.cs=1;
  end
  
  initial 
    #1000 $finish;
endmodule
