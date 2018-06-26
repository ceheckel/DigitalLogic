/* ***************************************************************\
| Name of program : Lab6
| Author : Charles Heckel
| Date Created : 6/07/2018
| Date last updated : 6/07/2018
| Function : produces exactly one output from 8 possible inputs
| Method : instantiates 7 sets of 3 2-input muxes to obtain a
|		3bit output from the 8 3bit inputs provided
| Inputs :	inU-Y	- 3bit inputs to be chosen by mux array
|				Sel	- 3bit selector to determine which input gets 
|		passed as output
| Output :	Out	- 3 bit output determined by Sel
| Additional Comments : (Extras)
\*****************************************************************/

module Mux5to1(inU, inV, inW, inX, inY, Sel, Out);
	//variables
	input [2:0] inU, inV, inW, inX, inY, Sel;
	wire  [2:0] temp0, temp1, temp2;
	output[2:0] Out;
	
	
	
	// implementation
	// each bit of input must pass through a 2-input mux
	// each bit from the selector will only choose bits from the same input
	// i.e. selector bit 0 chooses between input A or B, not A and D
	//
	// Mux2to1 mux#(InA,	InB,		Sel,	Out);
	
	// Multiplexor for inputs (U) and (V)
	Mux2to1 mux00(inU[0],	inV[0],		Sel[0],	temp0[0]);
	Mux2to1 mux01(inU[1],	inV[1],		Sel[0],	temp0[1]);
	Mux2to1 mux02(inU[2],	inV[2],		Sel[0],	temp0[2]);
	
	// Multiplexor for inputs (W) and (X)
	Mux2to1 mux03(inW[0],	inX[0],		Sel[0],	temp1[0]);
	Mux2to1 mux04(inW[1],	inX[1],		Sel[0],	temp1[1]);
	Mux2to1 mux05(inW[2],	inX[2],		Sel[0],	temp1[2]);
	
	// Multiplexor for inputs (winner of U vs. V) and (winner of W vs. X)
	Mux2to1 mux06(temp0[0],	temp1[0],	Sel[1],	temp2[0]);
	Mux2to1 mux07(temp0[1],	temp1[1],	Sel[1],	temp2[1]);
	Mux2to1 mux08(temp0[2],	temp1[2],	Sel[1],	temp2[2]);
	
	// Multiplexor for inputs (winner of U vs. V vs. W vs. X) and Y
	Mux2to1 mux09(temp2[0],	inY[0],		Sel[2],	Out[0]);
	Mux2to1 mux10(temp2[1],	inY[1],		Sel[2],	Out[1]);
	Mux2to1 mux11(temp2[2],	inY[2],		Sel[2],	Out[2]);
	
	
endmodule
