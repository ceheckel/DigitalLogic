/* ***************************************************************\
| Name of program : Reverser8
| Author : Charles Heckel
| Date Created : 6/04/2018
| Date last updated : 6/04/2018
| Function : mirrors the bits of the input and returns them
| Method : uses a for-loop to iterate through the input value
| Inputs : in			- 8bit value that will be mirrored
| Output : reverseIn	- 8bit return value
| Additional Comments : (Extras)
\*****************************************************************/

module Reverser8(input [7:0] in, output reg [7:0] reverseIn);
  // variables
  integer i;


  // Implementation
  always@(in)
  begin
    for (i = 0; i < 8; i = i + 1)	// starting from the MSB of in ...
    begin 
      reverseIn[i] = in[7-i];			// ... assign that number to the LSB of out
    end // for
  end // always

endmodule
