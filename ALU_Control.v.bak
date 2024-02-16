// ALU control

module ALU_Control (
 input [2:0] ALUOp,
 input [6:0] func7,
 input [2:0] func3,
 output reg [3:0] ALUControl_out
);

always @(*) begin

 if(ALUOp == 3'b111) begin
  case ({ALUOp, func7, func3})
   13'b111_0000000_110: ALUControl_out = 4'b0001; // SLL (Shift Left Logical) 1
   13'b111_0000001_110: ALUControl_out = 4'b0010; // SUB (Subtraction) 2 
   13'b111_0000010_110: ALUControl_out = 4'b0011; // ADD (Addition) 3 
   13'b111_0000101_110: ALUControl_out = 4'b0110; // XOR (Bitwise XOR) 6
   13'b111_0000110_110: ALUControl_out = 4'b0111; // SRL (Shift Right Logical) 7
   13'b111_0001000_110: ALUControl_out = 4'b1001; // OR (Bitwise OR) 9
   13'b111_0001001_110: ALUControl_out = 4'b1010; // AND (Bitwise AND) 10
   default : ALUControl_out = 4'bxxxx; // Handle invalid inputs
  endcase
 end else begin
  case (ALUOp)
   3'b000: ALUControl_out = 4'b0001; // SLLI (Shift Left Logical Immediate) 4
   3'b001: ALUControl_out = 4'b0010; // SUBI (Subtraction Immediate) 5
   3'b010: ALUControl_out = 4'b0011; // ADDI (Addition Immediate) 8
   3'b011: ALUControl_out = 4'b0110; // XORI (Bitwise XOR Immediate) 11
   3'b100: ALUControl_out = 4'b0111; // SRLI (Shift Right Logical Immediate) 3
   3'b101: ALUControl_out = 4'b1001; // ORI (Bitwise OR Immediate) 13
   3'b110: ALUControl_out = 4'b1010; // ANDI (Bitwise AND Immediate) 14 
   default : ALUControl_out = 4'bxxxx; // Handle invalid inputs
  endcase
 end
end
endmodule
