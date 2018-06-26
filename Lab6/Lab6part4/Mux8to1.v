/* ***************************************************************\
| Name of program : Lab6
| Author : Charles Heckel
| Date Created : 6/07/2018
| Date last updated : 6/07/2018
| Function : produces exactly one output from 8 possible inputs
| Method : instantiates 7 sets of 3 2-input muxes to obtain a
|		3bit output from the 8 3bit inputs provided
| Inputs :	inU-Y	- 3bit inputs to be chosen by mux array
|				inA-C	- 3bit inputs to be chosen by mux array
|				Sel	- 3bit selector to determine which input gets 
|		passed as output
| Output :	Out	- 3 bit output determined by Sel
| Additional Comments : (Extras)
\*****************************************************************/

module Mux8to1(inU, inV, inW, inX, inY, inA, inB, inC, Sel, Out);
	//variables
	input [2:0] inU, inV, inW, inX, inY, inA, inB, inC, Sel;
	wire  [2:0] temp0, temp1, temp2, temp3, temp4, temp5;
	output[2:0] Out;
	
	
	// implementation
	// each bit of input must pass through a 2-input mux
	// each bit from the selector will only choose bits from the same input
	// i.e. selector bit 0 chooses between input A or B, not A and D
	//
	// Mux2to1 mux#(InA,		InB,			Sel,		Out);
	
	// Multiplexor for inputs (U) and (V) a.k.a. Match1
	Mux2to1 mux00(inU[0],	inV[0],		Sel[0],	temp0[0]);
	Mux2to1 mux01(inU[1],	inV[1],		Sel[0],	temp0[1]);
	Mux2to1 mux02(inU[2],	inV[2],		Sel[0],	temp0[2]);
	
	// Multiplexor for inputs (W) and (X) a.k.a. Match2
	Mux2to1 mux03(inW[0],	inX[0],		Sel[0],	temp1[0]);
	Mux2to1 mux04(inW[1],	inX[1],		Sel[0],	temp1[1]);
	Mux2to1 mux05(inW[2],	inX[2],		Sel[0],	temp1[2]);
	
	// Multiplexor for inputs (Y) and (A) a.k.a. Match3
	Mux2to1 mux06(inY[0],	inA[0],		Sel[0],	temp2[0]);
	Mux2to1 mux07(inY[1],	inA[1],		Sel[0],	temp2[1]);
	Mux2to1 mux08(inY[2],	inA[2],		Sel[0],	temp2[2]);
	
	// Multiplexor for inputs (B) and (C) a.k.a. Match4
	Mux2to1 mux09(inB[0],	inC[0],		Sel[0],	temp3[0]);
	Mux2to1 mux10(inB[1],	inC[1],		Sel[0],	temp3[1]);
	Mux2to1 mux11(inB[2],	inC[2],		Sel[0],	temp3[2]);
	
	// Multiplexor for inputs (winner of Match1) and (winner of Match2) a.k.a. Match5
	Mux2to1 mux12(temp0[0],	temp1[0],	Sel[1],	temp4[0]);
	Mux2to1 mux13(temp0[1],	temp1[1],	Sel[1],	temp4[1]);
	Mux2to1 mux14(temp0[2],	temp1[2],	Sel[1],	temp4[2]);
	
	// Multiplexor for inputs (winner of Match3) and (winner of Match4) a.k.a. Match6
	Mux2to1 mux15(temp2[0],	temp3[0],	Sel[1],	temp5[0]);
	Mux2to1 mux16(temp2[1],	temp3[1],	Sel[1],	temp5[1]);
	Mux2to1 mux17(temp2[2],	temp3[2],	Sel[1],	temp5[2]);
	
	// Multiplexor for inputs (winner of Match5) and (winner of Match6) a.k.a. Match7
	Mux2to1 mux18(temp4[0],	temp5[0],	Sel[2],	Out[0]);
	Mux2to1 mux19(temp4[1],	temp5[1],	Sel[2],	Out[1]);
	Mux2to1 mux20(temp4[2],	temp5[2],	Sel[2],	Out[2]);
	
	
endmodule
