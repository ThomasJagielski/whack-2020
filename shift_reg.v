`timescale 1ns / 1ps

module shift_reg(
  (parameter W = 8)
  input              clk,
  input              _rst,
  input      [W-1:0] D,  
  output reg [W-1:0] Q);

  generate genvar i;
    for (i=0; i < W; i=i+1) begin
      dff dff_inst(clk, _rst, D[i], D[i-1]);

    end
  endgenerate

endmodule