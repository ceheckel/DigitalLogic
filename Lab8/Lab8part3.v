/* ***************************************************************************\
| Name of program : Lab8
| Author : Charles Heckel
| Date Created : 6/19/2018
| Date last updated : 6/19/2018
| Function : a gated D latch with hardware signals connecting DE2-115 FPGA
| Method : uses an instance of Lab8part2 to create a custom made D-latch which
|		will receive/send I/O signals from hardware on the DE2-115 board
| Inputs : SW   - set of 2 input signals that act as the clock (SW1) and D 
|		input (SW0)
| Output : LEDR - set of 1 output LED
| Additional Comments : (Extras)
\*****************************************************************************/
module Lab8part3(SW, LEDR);
  // variables
  input  [1:0] SW; // hardware input signals replaced Clk and D 
  output [0:0] LEDR; // hardware output signal replaced Q


  // instantiation
  Lab8part2 mod0(SW[1], SW[0], LEDR[0]);

endmodule
