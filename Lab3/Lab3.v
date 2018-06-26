/* ***************************************************************\
| Name of program : Lab3
| Author : Charles Heckel
| Date Created : 5/29/2018
| Date last updated : 5/29/2018
| Function : mimics the logic of the function, "f = AB + CD"
| Method : the program uses three built-in gate function to connect
|	input signals (Switches) to an output (LED)
| Inputs : SW	- Switches controlling the input signal values
| Output : LEDR	- Light illuminated by the result of the function
| Additional Comments : (Extras)
\*****************************************************************/

module Lab3(SW, LEDR);
  // initialization
  input[3:0] SW;	// four inputs: A,B,C,D
  output wire[0:0] LEDR;
  wire a, b;		// used to connect the AND gates to the OR gate
  
  // implementation of part 2
  and(a, SW[1], SW[0]);
  and(b, SW[3], SW[2]);
  or(LEDR[0], a, b);
  
  
  // implementation of part 3
  // Equivalency achieved through substitution
//  nand(a, SW[1], SW[0]);
//  nand(b, SW[3], SW[2]);
//  nand(LEDR[0], a, b);
  
  
  // implementation of part 4
  // Equivalency achieved through continuous assignment
//  assign LEDR[0] = (SW[0] & SW[1]) | (SW[3] & SW[2]);
  
  
 endmodule // Lab3
 