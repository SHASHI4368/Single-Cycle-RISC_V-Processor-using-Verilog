// Instruction Memory

module Instruction_Memory(
    input clk, reset,
    input [31:0] read_address,
    output reg [31:0] instruction
);

reg [31:0] memory [63:0]; 
integer i;
assign instruction = memory[read_address];

always @(posedge clk)
begin
 if(reset) begin
  for(i=0; i<64; i=i+1) begin
   memory[i] <= 0;
  end
 end else if(~reset)
  //R - type instructions

    memory[6'd4] = 32'b0000000_01000_00111_110_01001_0110011; //SLL
    memory[6'd8] = 32'b0000001_00101_00100_110_00110_0110011; //SUB 
    memory[6'd12] = 32'b0000010_00010_00001_110_00011_0110011; //ADD 
    memory[6'd16] = 32'b0000101_10001_10000_110_10010_0110011; //XOR
    memory[6'd20] = 32'b0000110_10100_10011_110_10101_0110011; //SRL
    memory[6'd24] = 32'b0001000_11010_11001_110_11011_0110011; //OR
    memory[6'd28] = 32'b0001001_11101_11100_110_11110_0110011; //AND  

    //I - type instructions
    memory[6'd32] = 32'b000000000011001_11001_01001_0000111; //SLLI
    memory[6'd36] = 32'b000000001000100_11101_11000_0001011; //SUBI
    memory[6'd40] = 32'b000000000010000_00110_00011_0001111; //ADDI 
    memory[6'd44] = 32'b000000000110100_00100_10010_0011011; //XORI
    memory[6'd48] = 32'b000000000111100_11101_10101_0011111; //SRLI
    memory[6'd52] = 32'b000000001001110_01110_11011_0100111; //ORI
    memory[6'd56] = 32'b000000001010111_00111_11110_0101011; //ANDI

end

endmodule