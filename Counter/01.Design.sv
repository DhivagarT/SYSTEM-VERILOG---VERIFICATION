//Counter up/Down Verification
module counter(input logic clk,logic rst,logic enb,output logic [2:0]count);
  
  always_ff @(posedge clk )begin
    if(rst)
      count <= 3'd0;
    else if(enb)
      count <= count+1;
    else if(!enb)
      count <= count-1;
  end
endmodule
      
