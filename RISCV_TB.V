// Testbench

module Top_tb;

reg clk, reset;

RISCV top(.CLK(clk), .RESET(reset));

initial begin
 clk = 0;
end

always #50 clk = ~clk;

initial begin
 reset = 1'b1;
 #50 reset = 1'b0;
 #400;
end

endmodule