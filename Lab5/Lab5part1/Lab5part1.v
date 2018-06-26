/* ***************************************************************\
| Name of program : Lab5
| Author : Charles Heckel
| Date Created : 6/05/2018
| Date last updated : 6/05/2018
| Function : performs bitwise addition based on input signals
| Method : Instantiates a Half-Adder to perform addition
| Inputs :	SW	- set of switches from the DE2-115 board
| Output :	LEDR- set of LEDs from the DE2-115 board
| Additional Comments : (Extras)
\*****************************************************************/

module Lab5part1(SW, LEDR);
  // variables
  input [2:1] SW;
  output[2:1] LEDR;
  
  // implementation
  HA adder0(SW[1], SW[2], LEDR[2], LEDR[1]);

endmodule
