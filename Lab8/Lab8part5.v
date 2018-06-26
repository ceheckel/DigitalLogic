/* ***************************************************************************\
| Name of program : Lab8
| Author : Charles Heckel
| Date Created : 6/19/2018
| Date last updated : 
| Function : a D-Flipflop with positive edge clock trigger and asynchronous 
|		active low reset with the purpose of counting
| Method : instantiates two D-flipflops to control two seperate counters 
|		simultaneously. One counter is active when the enable bit is high,
|		the other is active when the enable bit is low.
| Inputs : 
| Output : 
| Additional Comments : (Extras)
\*****************************************************************************/
module Lab8part5(SW, KEY, LEDG, LEDR);
  // variables
  input [2:0] SW;
  input [0:0] KEY;
  // SW[0] is the enable bit
  // SW[1] is the reset bit
  // SW[2] is the clock input for counterLow
  // KEY0 is the clock input for counterHigh
  output [7:0]  LEDG;
  output [15:0] LEDR;
  // Green LEDs are used for counterHigh
  // Red LEDs are used for counterLow
  
  
  // instantiation
  Lab8part4 countHighControl(KEY[0], SW[1], ~(SW[0]), LEDG);
  Lab8part4 countLowControl(  SW[2], SW[1],   SW[0] , LEDR);
  
endmodule
