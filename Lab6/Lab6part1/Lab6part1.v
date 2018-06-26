/* ***************************************************************\
| Name of program : Lab6
| Author : Charles Heckel
| Date Created : 6/07/2018
| Date last updated : 6/07/2018
| Function : front man code for Mux2to1 module.  This module is
|		necessary for testing purposed
| Method : forwards the inputs and output signals to the Mux2to1
|		module
| Inputs :	InA	- one of two 1bit input signals to be chosen by Sel
|			InB	- one of two 1bit input signals to be chosen by Sel
|			Sel	- 1bit selector variable that determines output
| Output :	Out	- 1bit output chosen by selector bit
| Additional Comments : (Extras)
\*****************************************************************/

module Lab6part1(InA, InB, Sel, Out);
	// variables
	input InA, InB, Sel;
	output wire Out;
	
	// implementation
	Mux2to1 mux0(InA, InB, Sel, Out);
	
	
endmodule
