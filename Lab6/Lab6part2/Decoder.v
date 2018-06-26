/* ***************************************************************\
| Name of program : Lab6
| Author : Charles Heckel
| Date Created : 6/07/2018
| Date last updated : 6/07/2018
| Function : Displays a letter to the DE2-115 board's SSD based on
|		input values
| Method : uses a case statement to check the possible input values
|		then produces an output as necessary
| Inputs :	sel	- 3bit selector determines with letter to display
| Output :	display-port to one of the DE2-115 board's SSDs
| Additional Comments : (Extras)
\*****************************************************************/

module Decoder(sel, display);
	// variables
	input [2:0] sel;
	output reg [0:6] display;
	
	// implementation
	always@(sel)
	begin
		display = 7'b1111111;
		case(sel)
			3'o0:	display = 7'b1001000;	// H
			3'o1:	display = 7'b0110000;	// E
			3'o2:	display = 7'b1110001;	// L
			3'o3:	display = 7'b0000001;	// O
//			3'o4:	display = 7'b1110111;	// _
			default:	display = 7'b1111111;	// all other inputs don't display
		endcase
	end // always
	
endmodule
