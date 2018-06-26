/* ***************************************************************\
| Name of program : Reverser64
| Author : Charles Heckel
| Date Created : 6/04/2018
| Date last updated : 6/04/2018
| Function : mirrors the bits of the input and returns them
| Method : uses instances of Reverser8 to scale up to 64bit inputs
| Inputs : in	- 64bit input value to be mirrored
| Output : out	- 64bit return value
| Additional Comments : (Extras)
\*****************************************************************/

module Reverser64(input [63:0] in, output [63:0] out);
  // variables


  // Implementation
  Reverser8 first8  (in[63:56], out[7:0]);
  Reverser8 second8 (in[55:48], out[15:8]);
  Reverser8 third8  (in[47:40], out[23:16]);
  Reverser8 fourth8 (in[39:32], out[31:24]);
  Reverser8 fifth8  (in[31:24], out[39:32]);
  Reverser8 sixth8  (in[23:16], out[47:40]);
  Reverser8 seventh8(in[15:8],  out[55:48]);
  Reverser8 eighth8 (in[7:0],   out[63:56]);

endmodule
