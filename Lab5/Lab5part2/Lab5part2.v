/* ***************************************************************\
| Name of program : Lab5
| Author : Charles Heckel
| Date Created : 6/05/2018
| Date last updated : 6/05/2018
| Function : performs bitwise addition based on input signals
| Method : instantiates a Full-Adder to perform bitwise addition
| Inputs :	SW	- set of switches from DE2-115 board
| Output :	LEDR- set of LEDs from DE2-115 board
| Additional Comments : (Extras)
\*****************************************************************/

module Lab5part2(SW, LEDR);
  // variables
  input [2:0] SW;
  output[2:1] LEDR;
  
  // implementation
  FA adder0(SW[0], SW[1], SW[2], LEDR[2], LEDR[1]);

endmodule
