// Data Memory

module Data_Memory(
 input clk, reset, MemWrite, MemRead,
 input [31:0] address, Writedata,
 output reg [31:0] Data_out
);

  reg [31:0] DataMemory [63:0];
  integer k;
  
  assign Data_out = (MemRead) ? DataMemory[address] : 32'b0;

  always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
      for (k = 0; k < 64; k = k + 1) begin 
        DataMemory[k] = 32'b0;
      end
    end
    else if (MemWrite) begin
      DataMemory[address] = Writedata;
    end
  end

endmodule