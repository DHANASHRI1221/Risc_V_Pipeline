`timescale 1ns/1ps
module instr_fetch(input clk, input rst, output reg [31:0] pc_out, output reg [31:0] instr_out, input pc_src);
  reg [31:0] pc;
  initial pc = 0;
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      pc <= 0; pc_out <= 0; instr_out <= 32'b0;
    end else begin
      if (pc_src) pc <= pc + 4; // simplified
      else pc <= pc + 4;
      pc_out <= pc;
      // instr_out is expected to be driven by testbench memory via $readmemh in sim
      instr_out <= 32'b0; // placeholder
    end
  end
endmodule