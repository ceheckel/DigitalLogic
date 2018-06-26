/* ***************************************************************\
| Name of program : Lab5
| Author : Charles Heckel
| Date Created : 6/05/2018
| Date last updated : 6/05/2018
| Function : performs bitwise addition based on input signals from
|		DE2-115 board switches
| Method : creates four full adders to calculate sum of inputs,
|		sends sum to display
| Inputs : 	SW	- set of input switches on the DE2-115 board
| Output :	LEDR- set of output LEDs on the DE2-115 board
|			HEX0- Output SSD on DE2-115 board
|			HEX1- Output SSD on DE2-115 board
| Additional Comments : (Extras)
\*****************************************************************/

module Lab5part3(SW, LEDR, HEX0, HEX1);
  // variables
  input  [7:0] SW;			// inputA uses 0-3, inputB uses 4-7
  output [4:0] LEDR;			// LED result
  output [0:6] HEX0, HEX1;	// SSD result
  wire   [3:0] sum;			// num result
  wire   [7:0] carry;		// ripple wire between adders (only need 5, but why not 8?)
  
  // implementation
  // adder#(carryIn , inpuA, inpuB, carryout, sum);
  FA adder0(1'b0    , SW[0], SW[4], carry[0], sum[0]);	// no carry in on first bit
  FA adder1(carry[0], SW[1], SW[5], carry[1], sum[1]);	// carry out becomes carry in
  FA adder2(carry[1], SW[2], SW[6], carry[2], sum[2]);
  FA adder3(carry[2], SW[3], SW[7], carry[3], sum[3]);
  
  // return outputs
  assign LEDR[3:0] = sum[3:0];	// assign sum to output LEDs
  assign LEDR[4]   = carry[3];	// don't forget about the overflow bit
  hex7seg digit0( .num(sum[3:0]),   .display(HEX0) );	// give SSD input
  hex7seg digit1( .num(carry[6:3]), .display(HEX1) );	// overflow bit starts at index 3

endmodule
