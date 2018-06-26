/* ***************************************************************\
| Name of program : Lab4part2
| Author : Charles Heckel
| Date Created : 5/31/2018
| Date last updated : 5/31/2018
| Function : routes input signals to decoder
| Method : uses a custom function described elsewhere in project
| Inputs : 	SW		- vector of hardware switches used for input
| Output : 	HEX0	- single SSD used as output device
|				HEX1	- see above
|				HEX2	- see above
|				HEX3	- see above
| Additional Comments : (Extras)
\*****************************************************************/

module Lab4part2(SW, HEX0, HEX1, HEX2, HEX3);
  input [15:0] SW; // switches for each of the SSDs
  output wire [0:6] HEX0; // wire for each of the seven segments on one display, HEX0
  output wire [0:6] HEX1;
  output wire [0:6] HEX2;
  output wire [0:6] HEX3;
  
  
  // Implementation
  // hex7seg is declared elsewhere
  hex7seg digit0(SW[3:0], HEX0);
  
  // additional three digits used in part 3
  hex7seg digit1(SW[7:4], HEX1);
  hex7seg digit2(SW[11:8], HEX2);
  hex7seg digit3(SW[15:12], HEX3);
  

endmodule
