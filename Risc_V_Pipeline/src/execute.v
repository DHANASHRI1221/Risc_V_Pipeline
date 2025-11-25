`timescale 1ns/1ps
module execute(input clk, input rst, input [31:0] rs1, input [31:0] rs2, output [31:0] alu_out);
  wire [31:0] result;
  wire [3:0] alu_ctrl = 4'd0; // placeholder
  alu ALU(.a(rs1), .b(rs2), .alu_ctrl(alu_ctrl), .result(result));
  assign alu_out = result;
endmodule