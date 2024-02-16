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
   7'b0111111: begin // I-type 
    ALUSrc <= 1;
    MemtoReg <= 0;
    RegWrite <= 1;
    MemRead <= 1;
    MemWrite <= 0;
    Branch <= 0;
    ALUOp <= 3'b000;
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