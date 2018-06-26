/* ***************************************************************\
| Name of program : Lab6
| Author : Charles Heckel
| Date Created : 6/07/2018
| Date last updated : 6/07/2018
| Function : displays output letter based on input values
| Method : instantiates a decoder to interpret input value set
| Inputs :	SW	- set of hardware switches from the DE2-115 board
| Output :	HEX0- one of the SSDs from the DE2-115 board
| Additional Comments : (Extras)
\*****************************************************************/

module Lab6part2(SW, HEX0);
	// variables
	input [17:15] SW;
	output[0:6] HEX0;
	
	
	// implementation
	Decoder ssd0(SW[17:15], HEX0);
	
	
endmodule
