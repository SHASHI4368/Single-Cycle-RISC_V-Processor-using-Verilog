// Program Counter

module ProgramCounter(
    input clk, reset,
    input [31:0] PC_in,
    output reg [31:0] PC_out
);

always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
        PC_out <= 0;
    end else begin
        PC_out <= PC_in;
    end
end

endmodule