// Program counter adder

module PCplus4(
    input [31:0] fromPC,
    output [31:0] nextToPC
);

assign nextToPC = fromPC + 32'h00000004;

endmodule