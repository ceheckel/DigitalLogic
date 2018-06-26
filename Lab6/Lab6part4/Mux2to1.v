/* ***************************************************************\
| Name of program : Lab6
| Author : Charles Heckel
| Date Created : 6/07/2018
| Date last updated : 6/07/2018
| Function : Chooses between two input bits
| Method : Uses boolean logic to select exactly one output
| Inputs :	InA	- one of two bits to be chosen from
|				InB	- one of two bits to be chosen from
|				Sel	- chooses which of the two inputs becomes output
| Output :	Out	- single bit chosen from input values
| Additional Comments : (Extras)
\*****************************************************************/

module Mux2to1(InA, InB, Sel, Out);
	//variables
	input InA, InB, Sel;
	output wire Out;
	
	
	// implementation
	// use boolean arithmetic to select either A or B based on value of Sel
	// x----AND
	//      GATE --+
	//   +--HERE   |
	//   |         |
	//  NOT        +--OR
	//  GATE          GATE --- m
	//   |         +--HERE
	// s-+--AND    |
	//      GATE---+
	// y----HERE
	//
	//  s | m
	// ---+---
	//  0 | x
	//  1 | y
	//
	assign Out=(~Sel & InA) | (Sel & InB); 
	
endmodule
