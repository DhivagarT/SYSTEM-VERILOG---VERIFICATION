//D flip flop
module d_flip_flop(intf.dut intff);
  always@(posedge intff.clk or posedge intff.rst)begin
    if(intff.rst)
       intff.q=0;
    else
      intff.q=intff.d;
  end
endmodule
  
