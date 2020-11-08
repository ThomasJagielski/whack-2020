// W-bit Carry Save Adder
`timescale 1ns / 1ps

module csa(
  input  [W-1:0] A,B,C, 
  output [W-1:0] S,     
  output [W-1:0] Co);   

  parameter W = 4;

  generate genvar i;
    for (i=0; i < W; i=i+1) begin
      full_adder fa_sum(A[i],B[i],C[i],S[i],Co[i]);
    end
  endgenerate

endmodule