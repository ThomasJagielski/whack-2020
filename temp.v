`timescale 1ns / 1ps


module temp(
  input [W-1:0] temp1,
  input [W-1:0] temp2,
  input [W-1:0] temp3,
  input [W-1:0] temp4,
  input [W-1:0] temp_compare,
  output tooHot);

  parameter DLY = 5;
  parameter W = 8;
  
  reg [W-1:0] sumcsa1;
  reg [W-1:0] coutcsa1;
  reg [W-1:0] sumcsa2;
  reg [W-1:0] coutcsa2;
  reg [W:0] sumrca1;
  wire coutrca1;

  csa tempcsa1(temp3,temp2,temp1,sumcsa1,coutcsa1);
  defparam tempcsa1.W = W;

  csa #100 tempcsa2(temp4,sumcsa1,{coutcsa1[W-2:0],1'b0},sumcsa2,coutcsa2);
  defparam tempcsa2.W = W;

  rca ripple_sum({1'b0,sumcsa2},{coutcsa1[W-1],coutcsa2},1'b0,sumrca1,coutrca1);
  defparam ripple_sum.W = W+1;

  //reg [W-1:0] avg;
  //assign avg = (temp1 + temp2 + temp3 + temp4) / 4;

  assign tooHot = (sumrca1 / 4) > temp_compare;
  //assign tooHot = avg < temp_compare;

endmodule 
