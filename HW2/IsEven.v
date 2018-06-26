/* ***************************************************************\
| Name of program : IsEven
| Author : Charles Heckel
| Date Created : 6/04/2018
| Date last updated : 6/04/2018
| Function : implementation of homework 2 question 1
| Method : 
| Inputs : num		- number to be tested for even-ness
| Output : isEven	- single bit boolean value
| Additional Comments : (Extras)
\*****************************************************************/

module IsEven(input num, output reg isEven);
  always@(num)
  begin
    isEven = 1'b1;	// assume guilty until proven innocent
    if(num % 2 == 1'b1)	// if num%2 has a remainder ...
    begin
      isEven = 1'b0;	// ... set boolean flag to false
    end // if
  end // always

endmodule