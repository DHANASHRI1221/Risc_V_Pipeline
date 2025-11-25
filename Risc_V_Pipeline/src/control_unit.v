`timescale 1ns/1ps
module control_unit(input [6:0] opcode, output reg reg_write, output reg mem_read, output reg mem_write, output reg branch, output reg [3:0] alu_ctrl);
  always @(*) begin
    // Simplified control for demo
    reg_write = 0; mem_read = 0; mem_write = 0; branch = 0; alu_ctrl = 0;
    case (opcode)
      7'b0110011: begin reg_write = 1; alu_ctrl = 4'd0; end // R-type
      7'b0000011: begin mem_read = 1; reg_write = 1; alu_ctrl = 4'd0; end // LW
      7'b0100011: begin mem_write = 1; alu_ctrl = 4'd0; end // SW
      7'b1100011: begin branch = 1; alu_ctrl = 4'd1; end // Branch
      default: begin end
    endcase
  end
endmodule