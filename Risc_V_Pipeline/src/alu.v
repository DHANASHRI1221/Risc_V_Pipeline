`timescale 1ns/1ps
module alu(input [31:0] a, input [31:0] b, input [3:0] alu_ctrl, output reg [31:0] result);
  always @(*) begin
    case (alu_ctrl)
      4'd0: result = a + b;
      4'd1: result = a - b;
      4'd2: result = a & b;
      4'd3: result = a | b;
      4'd4: result = a ^ b;
      4'd5: result = (a < b) ? 32'd1 : 32'd0;
      default: result = 32'b0;
    endcase
  end
endmodule