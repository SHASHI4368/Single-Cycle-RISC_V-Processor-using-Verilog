module Mux (
 input Sel,
 input [31:0] A1, B1,
 output [31:0] Mux_out
);

assign Mux_out = (Sel==1'b0) ? A1: B1;

endmodule