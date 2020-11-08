// Testbench for carry save adder
`timescale 1ns / 1ps

module test_temp;

  parameter W = 16;

  // Regs and wires for input/output
  reg [W-1:0] temp1 = 2;
  reg [W-1:0] temp2 = 2;
  reg [W-1:0] temp3 = 4;
  reg [W-1:0] temp4 = 4;
  reg [W-1:0] temp_compare = 2;
  wire   tooHot;

  // Define the width of the Fibonnaci number storage register
  //parameter W = 16;
  // Delay should scale as a function of W
  // to account for worst-case carry length
  //parameter CLK = 100;
  // It's already defined in ripple_carry_adder
  // but let's go ahead and override it here for fun.
  //defparam DUT.W=W;

  //Instantiate your "Device Under Test"
  temp DUT(temp1, temp2, temp3, temp4, temp_compare, tooHot);
  defparam DUT.W = W;

  initial begin
    // Hooks for vvp/gtkwave
    // the *.vcd filename should match the *.v filename for Makefile cleanliness
    $dumpfile("test_temp.vcd");
    $dumpvars(0,test_temp);
    
    //clk  = 1'b0;
    //_rst = 1'b0;

    // Wait for reset nodes to settle
    #600; 
    // Output the first 24 numbers
    // for (int i = 0; i < 24; i = i+1) begin
    //   #(2*CLK) $display("%d",S);
    // end

    // Display values
    $display("%d, %d, %d, %d, %d, %d", temp1, temp2, temp3, temp4, temp_compare, tooHot);

    $finish;
  end
  
  // Toggle clock
  //always #CLK clk = ~clk;


endmodule
