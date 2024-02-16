module Immediate_Generator(
    input [11:0] instruction,
    output reg [31:0] data_out
);

always @(*) begin
    // Sign extension
    if (instruction[11] == 1'b1)
        data_out = { {20{instruction[11]}}, instruction };
    else
        data_out = {20'b0, instruction}; 
end

endmodule
