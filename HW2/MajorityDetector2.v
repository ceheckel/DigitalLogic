/* ***************************************************************\
| Name of program : MajorityDetector2
| Author : Charles Heckel
| Date Created : 6/04/2018
| Date last updated : 6/04/2018
| Function : returns the value held within any two inputs, or the
|		value from 'in2' if no similar values exist
| Method : the function uses an always block and if-then-else
|		statements to compare the three inputs
| Inputs :	in0		- register of predetermined size
|				in1		- register of predetermined size
|				in2		- register of predetermined size
| Output :	majority	- return value of most reoccurring value
| Additional Comments : (Extras)
\*****************************************************************/

module MajorityDetector2(in0, in1, in2, majority);
  parameter numIns = 4; // 'n' is an arbitrary value and should be assigned before compile time
  input [numIns-1:0] in0, in1, in2;
  output reg [numIns-1:0] majority;
  

  // Implementation
  always@(in0,in1,in2)
  begin
    if(in0 == in1 || in0 == in2)	// if in0 matches either remaining input...
    begin
      majority = in0;				// ... use in0's value as output
    end // if
    else if(in1 == in2)				// if in1 matches the remaining inputs ...
    begin 
      majority = in1;				// ... use in1's value as output
    end // else if
    else									// If no two inputs match ...
    begin
      majority = in2;				// ... use in2's value as output (priority)
    end // else
  end // always

endmodule
