/* ***************************************************************\
| Name of program : MultipleOf3or5
| Author : Charles Heckel
| Date Created : 6/04/2018
| Date last updated : 6/04/2018
| Function : determines if the combination of 6 input bits creates
|		a binary number that is divisible by 3 and/or 5
| Method : performs arithmetic manipulation to create a decimal
|		number from the 6bits, then preforms terinary operations in
|		continuous assignment statements
| Inputs :	N5		- MSB
|				N4-1	- bits of a binary number
|				N0		- LSB
| Output : 	M3		- single bit boolean flag for divisibility with 3
| 				M5		- single bit boolean flag for divisibility with 5
| Additional Comments : (Extras)
\*****************************************************************/

module MultipleOf3or5(N5, N4, N3, N2, N1, N0, M3, M5);
  // variables
  input N5, N4, N3, N2, N1, N0;
  output M3, M5;
  wire [5:0] decimalRep = { N5, N4, N3, N2, N1, N0 };


  // Implementation
  assign M3 = (decimalRep%3 == 0 ? 1'b1 : 1'b0); // modulo3 boolean for output
  assign M5 = (decimalRep%5 == 0 ? 1'b1 : 1'b0); // modulo5 boolean for output

endmodule
