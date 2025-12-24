interface intf #(parameter WIDTH=8,
                parameter DEPTH=32);
  logic clk;
  logic rst;
  logic cs;
  logic wr_enb;
  logic rd_enb;
  logic [WIDTH-1:0]data_in;
  logic [WIDTH-1:0]data_out;
  logic full;
  logic empty;
  
endinterface
