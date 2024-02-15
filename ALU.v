// ALU

module ALU(
    input [31:0] A, B,
    input [3:0] ALU_control_in,
    output reg [31:0] ALU_result,
    output reg zero
);

always @(ALU_control_in or A or B)
begin 
 case(ALU_control_in)
  4'b0011: begin // add
   zero <= 0;
   ALU_result <= A + B;
  end
  4'b0010: begin // sub
   zero <= 0;
   ALU_result <= A - B;
  end
  4'b0001: begin // SLL - bitwise left shift
   zero <= 0;
   ALU_result <= A << B;
  end
  4'b0110: begin //XOR
   zero <= 0;
   ALU_result <= A ^ B;
  end
  4'b0111: begin //SRL - Shift Right Logic
   zero <= 0;
   ALU_result <= A >> B;
  end
  4'b1001: begin //OR - bitwise OR
   zero <= 0;
   ALU_result <= A | B;
  end
  4'b1010: begin //AND - bitwise AND
   zero <= 0;
   ALU_result <= (A & B);
  end
  default: begin // default to add
   zero <= 0;
   ALU_result <= A;
  end 
 endcase
end

endmodule