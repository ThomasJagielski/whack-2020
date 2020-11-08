// Full Adder Verilog
`timescale 1ns / 1ps

module full_adder(
  input A, B,
  input Cin,
  output Sum,
  output Cout);

  parameter DLY = 5;

  wire xor1, nand1, nand2;

  // Sum
  xor #DLY xorgate1(xor1,A,B);
  xor #DLY xorgate2(Sum,xor1,Cin);
  // Carry Out
  nand #DLY nandgate1(nand1,xor1,Cin);
  nand #DLY nandgate2(nand2,A,B);
  nand #DLY nandgate3(Cout,nand1,nand2);

endmodule