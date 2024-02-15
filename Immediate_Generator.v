module Immediate_Generator(
    input [15:0] instruction,
    output reg [31:0] data_out
);

always @(*) begin
    // Sign extension
    if (instruction[15] == 1'b1)
        data_out = { {16{instruction[15]}}, instruction };
    else
        data_out = {16'b0, instruction}; 
end

endmodule
