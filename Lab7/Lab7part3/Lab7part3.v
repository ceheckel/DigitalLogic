/* ***************************************************************************\
| Name of program : Lab7
| Author : Charles Heckel
| Date Created : 6/12/2018
| Date last updated : 6/12/2018
| Function : displays an input signal across 3 SSDs, the input can be assumed
|		in two's complement form, but the value diplayed is the absolute
|		value with a negative sign on HEX2 if the input if negative.
| Method : instantiates two hex7seg decoders to display the absolute value to
|		the SSDs on the DE2-115 board.  Some logic is used to determine whether
|		the input is positive or negative.
| Inputs : SW  - set of input signals from the DE2-115 board, used as binary
|		input value
| Output : HEX - set of SSDs from the DE2-115 board
| Additional Comments : (Extras)
\*****************************************************************************/
module Lab7part3(SW, HEX0, HEX1, HEX2);
  // variables
  input [7:0] SW;
  output [0:6] HEX0, HEX1, HEX2;	// HEX2 displays the sign bit
  // magnitude is the absolute value of the input signal
  reg [7:0] magnitude;
  
  
  // instantiation
  hex7seg digit0(magnitude[3:0], HEX0);
  hex7seg digit1(magnitude[7:4], HEX1);
  assign HEX2 = ((SW[7] == 1'b1) ? 7'b1111110 : 7'b1111111);
  
  
  // implementation
  always@(SW)
  begin
    // if the MSB is a one, interpret the input value as a negative number
    (SW[7] == 1'b1) ? (magnitude = (SW[7:0] ^ 8'b11111111) + 1'b1) : (magnitude = SW[7:0]);
  end // always
  
endmodule
