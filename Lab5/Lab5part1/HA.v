/* ***************************************************************\
| Name of program : HA ("Half-Adder")
| Author : Charles Heckel
| Date Created : 6/05/2018
| Date last updated : 6/05/2018
| Function : creates a sum and carry out for two given inputs 
| Method : performs continuous assignment for sum and carry out
| Inputs :	A	- 1bit input
|			B	- 1bit input
| Output : 	Co	- 1bit output representing carry out
|			S	- 1bit output representing first bit sum of inputs
| Additional Comments : (Extras)
\*****************************************************************/

module HA(A, B, Co, S);
  // variables
  input A, B;
  output Co, S;
  
  // implementation
  assign S = A ^ B; // (!A && B) || (A && !B)
  assign Co = A & B;
  
endmodule