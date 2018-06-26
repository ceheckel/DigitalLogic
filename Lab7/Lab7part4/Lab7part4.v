/* ***************************************************************************\
| Name of program : Lab7
| Author : Charles Heckel
| Date Created : 6/12/2018
| Date last updated : 6/12/2018
| Function : 8bit full adder with values displayed on both the red LED set and
|		in hexadecimal on 3 SSDs
| Method : instantiates two hex7seg modules to display the value of the sum
|		some simple logic is used to display the sign bit of the sum.
|		some simple logic is used to determine the absolute value of the sum
| Inputs : SW   - set of input signals from the DE2-115 board
| Output : LEDR - set of output signals to the red LEDs on the DE2-115 board
|          HEX  - set of output SSDs on the DE2-115 board. displays the sum.
| Additional Comments : (Extras)
\*****************************************************************************/
module Lab7part4(SW, LEDR, HEX0, HEX1, HEX2);
  // variables
  // Switches 0-7 control value of inputA
  // Switches 8-15 control value of inputB
  input [15:0] SW;
  // LEDR represents the sum in binary of the two inputs
  // HEX0 is the first digit of the sum displayed in hexadecimal
  // HEX1 is the second digit of the sum ^^
  // HEX2 is the sign of the sum (negative or no-display)
  output[7:0] LEDR;
  output[0:6] HEX0, HEX1, HEX2;
  // 
  reg   [7:0] out;
  wire  [7:0] sum;
  
  
  // instantiation
  hex7seg digit0(out[3:0], HEX0);
  hex7seg digit1(out[7:4], HEX1);
  uAdder adder(SW[7:0], SW[15:8], sum);
  
  
  // implementation
  // determine if the sum has to be complemented based on the MSB
  assign HEX2 = ((sum[7] == 1'b1) ? 7'b1111110 : 7'b1111111);
  assign LEDR = sum;
  
  always@(SW, sum)
  begin
    // if the two input values are both negative, the sum is always negative
	// sum will need to be complemented
    if (SW[7] == 1'b1 && SW[15] == 1'b1)
	 begin
	   // (-) + (-) == (-)
      out = (sum ^ 8'hff) + 1'b1;
	 end // if A and B are negative
	 
	 // if the two input values are both positive, the sum is always positive
	 // no complementing is needed
	 else if(SW[7] == 1'b0 && SW[15] == 1'b0)
	 begin
	   // (+) + (+) == (+)
      out = sum;
	 end // if A and B are positive
	 
	 // if only one of the inputs is negative, the sum may or may not be neg.
	 // complement is needed based on the sum's MSB
	 else // sum of addition has unknown sign
	 begin
	   // (+) + (-) || (-) + (+)
		// determine output based on current sum value
	   out = ((sum[7] == 1'b1) ? ((sum ^ 8'hff)+1'b1) : (sum));
	 end // if-else-then
  end // always
  
endmodule
