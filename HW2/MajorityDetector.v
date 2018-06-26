/* ***************************************************************\
| Name of program : MajorityDetector
| Author : Charles Heckel
| Date Created : 6/04/2018
| Date last updated : 6/04/2018
| Function : determines if an input contains more 1's or 0's in its
|		binary representation
| Method : uses a for loop to iterate through the binary form
| Inputs : ins			- "inputs", number of a predetermined size to
|		search through
| Output : majority	- single bit flag holding the majority
| Additional Comments : (Extras)
\*****************************************************************/

module MajorityDetector(ins, majority);
  parameter numIns = 8; // 'n' is an arbitrary value and should be assigned before compile time
  input [numIns-1:0] ins;
  output majority;
  integer i, zeros, ones; // counters


  // Implementation
  always@(ins)
  begin
    // initialize counters
    i = 0;
    zeros = 0;
    ones = 0;

    // start logic
    if(ins[i] == 1'b0)
    begin
      zeros = zeros + 1;
    end // if
    else if(ins[i] == 1'b1)
    begin
      ones = ones + 1;
    end // else if
  end // always

  // return majority
  assign majority = ((ones > zeros) ? 1'b1 : 1'b0); // zero takes majority in a tie

endmodule