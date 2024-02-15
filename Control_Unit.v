// Control Unit

module Control_Unit(
 input reset,
 input [6:0] opcode,
 output reg RegWrite, MemtoReg, MemRead, MemWrite, Branch, ALUSrc,
 output reg [2:0] ALUOp
);

always @(*) begin
 if(reset) begin
  {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 7'b0000000;
 end
 else begin 
  case(opcode)
   7'b0110011: begin // R-type
    ALUSrc <= 0;
    MemtoReg <= 0;
    RegWrite <= 1;
    MemRead <= 0;
    MemWrite <= 0;
    Branch <= 0;
    ALUOp <= 3'b111;
   end
   7'b0000111: begin // I-type SLLI (Shift Left Logical Immediate) 4
    ALUSrc <= 1;
    MemtoReg <= 0;
    RegWrite <= 1;
    MemRead <= 1;
    MemWrite <= 0;
    Branch <= 0;
    ALUOp <= 3'b000;
   end
   7'b0001011: begin // I-type SUBI (Subtraction Immediate) 5
    ALUSrc <= 1;
    MemtoReg <= 0;
    RegWrite <= 1;
    MemRead <= 1;
    MemWrite <= 0;
    Branch <= 0;
    ALUOp <= 3'b001;
   end
   7'b0001111: begin // I-type ADDI (Addition Immediate) 8
    ALUSrc <= 1;
    MemtoReg <= 0;
    RegWrite <= 1;
    MemRead <= 1;
    MemWrite <= 0;
    Branch <= 0;
    ALUOp <= 3'b010;
   end
   7'b0011011: begin // I-type XORI (Bitwise XOR Immediate) 11
    ALUSrc <= 1;
    MemtoReg <= 0;
    RegWrite <= 1;
    MemRead <= 1;
    MemWrite <= 0;
    Branch <= 0;
    ALUOp <= 3'b011;
   end
   7'b0011111: begin // I-type SRLI (Shift Right Logical Immediate) 12
    ALUSrc <= 1;
    MemtoReg <= 0;
    RegWrite <= 1;
    MemRead <= 1;
    MemWrite <= 0;
    Branch <= 0;
    ALUOp <= 3'b100;
   end
   7'b0100111: begin // I-type ORI (Bitwise OR Immediate) 13
    ALUSrc <= 1;
    MemtoReg <= 0;
    RegWrite <= 1;
    MemRead <= 1;
    MemWrite <= 0;
    Branch <= 0;
    ALUOp <= 3'b101;
   end
   7'b0101011: begin // I-type ANDI (Bitwise AND Immediate) 14 
    ALUSrc <= 1;
    MemtoReg <= 0;
    RegWrite <= 1;
    MemRead <= 1;
    MemWrite <= 0;
    Branch <= 0;
    ALUOp <= 3'b110;
   end
   default: begin // R-type
    ALUSrc <= 0;
    MemtoReg <= 0;
    RegWrite <= 1;
    MemRead <= 0;
    MemWrite <= 0;
    Branch <= 0;
    ALUOp <= 3'b111;
   end
  endcase
 end

end

endmodule