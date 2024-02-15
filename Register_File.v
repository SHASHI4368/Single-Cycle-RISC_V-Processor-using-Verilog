// Register File

module Register_File(
    input clk, reset, RegWrite,
    input [4:0] Rs1, Rs2, Rd,
    input [31:0] Write_data,
    output reg [31:0] read_data1, read_data2
);

reg [31:0] registers [31:0];

initial begin
 registers[0] = 32'd0;
 registers[1] = 32'd1;
 registers[2] = 32'd6;
 registers[3] = 32'd34;
 registers[4] = 32'd5;
 registers[5] = 32'd8;
 registers[6] = 32'd2;
 registers[7] = 32'd67;
 registers[8] = 32'd56;
 registers[9] = 32'd45;
 registers[10] = 32'd50;
 registers[11] = 32'd41;
 registers[12] = 32'd24;
 registers[13] = 32'd23; 
 registers[14] = 32'd24;
 registers[15] = 32'd35;
 registers[16] = 32'd46;
 registers[17] = 32'd57;
 registers[18] = 32'd68;
 registers[19] = 32'd29;
 registers[20] = 32'd30;
 registers[21] = 32'd41;
 registers[22] = 32'd52;
 registers[23] = 32'd53;
 registers[24] = 32'd44;
 registers[25] = 32'd75;
 registers[26] = 32'd56;
 registers[27] = 32'd57;
 registers[28] = 32'd48;
 registers[29] = 32'd39;
 registers[30] = 32'd80;
 registers[31] = 32'd91;
end

integer i;
always @(posedge clk) begin
 if(reset) begin
  for(i=0; i<32; i=i+1) begin
   registers[i] <= 0;
  end
 end else if(~reset) begin
  if(RegWrite) begin
   registers[Rd] <= Write_data;
  end
 end
end

assign read_data1 = registers[Rs1];
assign read_data2 = registers[Rs2];

endmodule