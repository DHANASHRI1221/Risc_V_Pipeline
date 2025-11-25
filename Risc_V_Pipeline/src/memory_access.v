`timescale 1ns/1ps
module memory_access(input clk, input rst, input [31:0] addr, input [31:0] wdata, output reg [31:0] rdata);
  reg [31:0] data_mem [0:1023];
  initial begin
    // memory initialized by testbench if required
  end
  always @(posedge clk) begin
    rdata <= data_mem[addr[11:2]];
  end
endmodule