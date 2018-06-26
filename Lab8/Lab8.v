/* ***************************************************************************\
| Name of program : Lab8
| Author : Charles Heckel
| Date Created : 6/19/2018
| Date last updated : 6/20/2018
| Function : runs the various parts of the Lab
| Method : creates instantiations
| Inputs : vary based on active lab part
| Output : vary based on active lab part
| Additional Comments : (Extras)
\*****************************************************************************/
module Lab8(clock, reset, E, Q);
  // variables
  // each part uses its own variables which could be declared here, but for
  // clarity, are defined alongside their respective module instantiation
  // see below
  
  
  // instantiation
  // should only have one module active at a time
  
  // part 1
  /*
  input Clk, R, S;
  output Q;
  Lab8part1 part1(Clk, R, S, Q);
  */
  
  // part 2
  /*
  input Clk, D;
  output Q;
  Lab8part2 part2(Clk, D, Q);
  */
  
  // part 3
  /*
  input  [1:0] SW;
  output [0:0] LEDR;
  Lab8part3 part3(SW, LEDR);
  */
  
  // part 4
  /*
  input clock, reset, E;
  output [15:0] Q;
  Lab8part4 part4(clock, reset, E, Q);
  */
  
  // part 5
  /*
  input  [2:0]  SW;
  input  [0:0]  KEY;
  output [7:0]  LEDG;
  output [15:0] LEDR;
  Lab8part5 part5(SW, KEY, LEDG, LEDR);
  */
  
  // part 6
  /*
  input [15:0] SW;
  input [1:0] KEY;
  output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
  Lab8part6 part6(SW, KEY, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
  */
  
  // part 7
//  /*
  input clock, reset, E;
  output [15:0] Q;
  Lab8part7 part7(clock, reset, E, Q);
//  */
  
endmodule
