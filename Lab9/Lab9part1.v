/* ***************************************************************************\
| Name of program : Lab9
| Author : Charles Heckel
| Date Created : 6/26/2018
| Date last updated : 6/26/2018
| Function : demonstrates the functional difference between blocking and non-
|		blocking assignment statements
| Method : organize code such that only one always block is active and compile
|		Use the RTL Viewer tool in Quartus 2 to see the difference in synthesis
| Inputs : clk  - user defined clock cycle
|          A    - 8bit input signal from user
| Output : out1 - 8bit register that receives the value of A
|          out2 - 8bit register that receives the value of out1
| Additional Comments : (Extras)
\*****************************************************************************/
module Lab9part1(clk, A, out1, out2);
  input clk;
  input [7:0] A;
  
  output reg [7:0] out1, out2;
  
  // non-blocking approach
//  always@(posedge clk)
//  begin
//    out1 <= A;
//	 out2 <= out1;
//  end // always
  
  // blocking approach
  always@(posedge clk)
  begin
    out1 = A;
	 out2 = out1;
  end // always

endmodule
