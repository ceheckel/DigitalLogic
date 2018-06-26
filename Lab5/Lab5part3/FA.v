/* ***************************************************************\
| Name of program : Lab5
| Author : Charles Heckel
| Date Created : 6/05/2018
| Date last updated : 6/05/2018
| Function : creates a sum and carry out for three given inputs 
| Method : performs continuous assignment for sum and carry out
| Inputs :	A	- 1bit input
|			B	- 1bit input
|			Cin	- 1bit input
| Output : 	Co	- 1bit output representing carry out
|			S	- 1bit output representing first bit sum of inputs
| Additional Comments : (Extras)
\*****************************************************************/

module FA(Cin, A, B, Co, S);
  // variables
  input Cin, A, B;
  output Co, S;
  
  // implementation
  // S = (!Cin && !A && B) || (!Cin && A && !B) ||
  //		(Cin && !A && !B) || (Cin && A && B)
  assign S = (A^B)^Cin; 
  
  // Co = (!Cin && A && B) || (Cin && !A && B) ||
  //		 (Cin && A && !B) || (Cin && A && B)
  assign Co = (A&B) | ((A^B) & Cin);
  
endmodule
