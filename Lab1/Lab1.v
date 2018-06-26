/* ***************************************************************\
| Name of program : Lab1
| Author : Charles Heckel
| Date Created : 5/22/2018
| Date last updated : 5/22/2018
| Function : Basic program to connect to USB-Blaster
| Method : Module creates 6 input switches and 6 output LED signals
|				then assigns each switch to a unique LED
| Inputs : SW		- array of 6 input signals
| Output : LEDR	- array of 6 output signals
| Additional Comments : 
\*************************************************************** */

module Lab1(input[5:0] SW, output[5:0] LEDR); // start module
  // additional variables used
  
  
  // assign input switches to LEDs
  assign LEDR = SW;
  
endmodule // end of 'Lab1'
