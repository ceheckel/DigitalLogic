/* ***************************************************************************\
| Name of program : Lab9
| Author : Charles Heckel
| Date Created : 6/26/2018
| Date last updated : 
| Function : Used as a HUB for the various parts of the Lab
| Method : Each part of the lab contains its own I/O set, uncommenting one 
|		portion activates the lab part on next compile
| Inputs : varies based on active portion
| Output : varies based on active portion
| Additional Comments : (Extras)
\*****************************************************************************/
module Lab9(KEY, HEX0);
  // part 1
  /*
  input clk;
  input [7:0] A;
  output [7:0] out1, out2;
  Lab9part1 part1(clk, A, out1, out2);
  */
  
  
  // part 2
  /*
  input [3:0] KEY;
  output [0:6] HEX0;
  wire [3:0] SM_out;
//module Lab9part2(reset , clock  , in0    , in1    , outHex[3:0]); <-- prototype
  Lab9part2 part2(KEY[1], ~KEY[0], ~KEY[3], ~KEY[2], SM_out);
  hex7seg disp0(SM_out+4'h9, HEX0);
  */
  
  
  // part 3
  
  input [3:0] KEY;
  output [0:6] HEX0;
  wire [3:0] SM_out;
//module Lab9part2(reset , clock  , in0    , in1    , outHex[3:0]); <-- prototype
  Lab9part3 part3(KEY[1], ~KEY[0], ~KEY[3], ~KEY[2], SM_out);
  hex7seg disp0(SM_out+4'h9, HEX0);
  
  
endmodule
