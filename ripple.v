// Ripple Carry Adder
`timescale 1ns / 1ps

module rca(
  input  [W-1:0] A,B, 
  input          Cin,  
  output [W-1:0] Sum,   
  output         Cout); 

  parameter W = 8;

  wire[W:0] carry;

  generate genvar i;
    for (i=0; i < W; i=i+1) begin
      full_adder fa_inst(A[i],B[i],carry[i],Sum[i],carry[i+1]);
    end
  endgenerate

  assign carry[0] = Cin; 
  assign Cout = carry[W]; 

endmodule