/* ***************************************************************\
| Name of program : Lab7
| Author : Charles Heckel
| Date Created : 6/12/2018
| Date last updated : 6/12/2018
| Function : Displays a value to a set of seven-segment-displays
| Method   : Instantiates a modified version of hex7seg to decode 
|		a 4bit input value into a 7bit excess-4 biased SSD code
| Inputs : SW  - set of hardware switches from DE2-115 board
| Output : HEX - set of hardware SSDs from DE2-115 board
| Additional Comments : (Extras)
\*****************************************************************/

module Lab7part1(SW, HEX0, HEX1);
  // variables
  input [3:0] SW;
  // HEX1 is sign bit display
  // HEX0 is magnitude in hexadecimal
  output[0:6] HEX0, HEX1;
  
  
  // instantiation
  excess7seg digit0(SW, HEX0);	// display magnitude of input value
  
  // implementation
  // determine if input is above or below Excess-4's zero value
  // assign HEX1 accordingly (negative if < decimal 4)
  assign HEX1 = ((SW >= 4'b0100) ? 7'b1111111 : 7'b1111110);

endmodule
