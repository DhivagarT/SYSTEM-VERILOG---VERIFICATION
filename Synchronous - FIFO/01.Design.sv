//synchronous FIFO (negedge rst)

module synchronous_fifo #(
  parameter WIDTH=8,
  parameter DEPTH=32)
  ( input clk,
   input rst,
   input cs,
   input wr_enb,
   input rd_enb,
   input [WIDTH-1:0]data_in,
   output reg [WIDTH-1:0]data_out,
   output full,
   output empty);
  
  localparam fifo_depth_log=$clog2(DEPTH);
  
  reg [fifo_depth_log:0] wr_pnt;
  reg [fifo_depth_log:0] rd_pnt;
  reg [WIDTH-1:0]mem[0:DEPTH-1];
  
  always@(posedge clk or negedge rst)begin
    if(!rst)
      wr_pnt<=0;
    else if(cs&&wr_enb&&!full)begin
      mem[wr_pnt[fifo_depth_log-1:0]]<=data_in;
      wr_pnt<=wr_pnt+1;
    end
  end
  
  always@(posedge clk or negedge rst)begin
    if(!rst)
      rd_pnt<=0;
    else if(cs&&rd_enb&&!empty)begin
      data_out<=mem[rd_pnt[fifo_depth_log-1:0]];
      rd_pnt<=rd_pnt+1;
    end
  end
  
  assign empty=(rd_pnt==wr_pnt);
  assign full = (wr_pnt[fifo_depth_log] != rd_pnt[fifo_depth_log]) && 
              (wr_pnt[fifo_depth_log-1:0] == rd_pnt[fifo_depth_log-1:0]);
  
endmodule
    
      
