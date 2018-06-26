/* ***************************************************************************\
| Name of program : Lab8
| Author : Charles Heckel
| Date Created : 6/19/2018
| Date last updated : 6/20/2018
| Function : see part 4 for details
| Method : uses a library of parameterized modules to create D-flipflop with
|		asynchronous reset
| Inputs : clock - input signal that simulates a clock cycle
|          reset - input signal that simulates a reset cycle
|          E     - input signal that allows the output to change
| Output : Q     - 16bit output signal that corresponds to the counter's value
| Additional Comments : (Extras)
\*****************************************************************************/
module Lab8part7(clock, reset, E, Q);
  // variables
  input clock, reset, E;
  // 'E' represents the data input which takes the role of the enable
  output [15:0] Q;
  
  
  // instantiation
  //module MyLPMCounter (aclr, clk_en, clock, q); <-- prototype
  MyLPMCounter counter(~reset, E, clock, Q);
  
  
endmodule