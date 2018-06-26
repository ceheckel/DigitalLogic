/* ***************************************************************\
| Name of program : Lab4
| Author : Charles Heckel
| Date Created : 5/31/2018
| Date last updated : 5/31/2018
| Function : Turns on the lights of the display board after 50 
|	clock cycles
| Method : uses an internal clock and iterative code execution
| Inputs : CLOCK_50	- the internal clock of the DE2-115 board
| Output : LEDR		- vector of hardware LED displays
| Additional Comments : (Extras)
\*****************************************************************/

module Lab4(CLOCK_50, LEDR);
  input CLOCK_50; // Port List variables that are inputs
  output reg [17:0] LEDR; // Port List variables that are outputs
  // Additional variables
  parameter X = 5000000;
  reg [31:0] count = 0;
  
  // Implementation
  always @(posedge CLOCK_50)
  begin
    count = count + 1;	// increment clock cycle counter until it reaches the bound, X
    if (count == X)
    begin
      count = 0; // reset counter
      LEDR = LEDR + 1; // increment value of LED vector (toggle lights)
    end // if
  end // always
  
endmodule
