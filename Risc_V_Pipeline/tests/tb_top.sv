`timescale 1ns/1ps
module tb_top;
  reg clk, rst;
  initial begin
    clk = 0; forever #5 clk = ~clk; end
  initial begin
    rst = 1; #20; rst = 0;
  end

  // Instantiate DUT
  top dut(.clk(clk), .rst(rst));

  initial begin
    $display("Starting simulation...");
    // Load program memory using $readmemh from programs/*.hex produced from assembler
    #2000;
    $display("Finished");
    $finish;
  end
endmodule