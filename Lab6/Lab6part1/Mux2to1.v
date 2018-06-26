/* ***************************************************************\
| Name of program : Lab6
| Author : Charles Heckel
| Date Created : 6/07/2018
| Date last updated : 6/07/2018
| Function : produces exactly one output from 8 possible inputs
| Method : instantiates 7 sets of 3 2-input muxes to obtain a
|		3bit output from the 8 3bit inputs provided
| Inputs :	inA-B	- 1bit inputs to be chosen by mux array
|				Sel	- 1bit selector to determine which input gets 
|		passed as output
| Output :	Out	- 1 bit output determined by Sel
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
