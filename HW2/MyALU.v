/* ***************************************************************\
| Name of program : MyALU
| Author : Charles Heckel
| Date Created : 6/04/2018
| Date last updated : 6/04/2018
| Function : performs basic arithmetic operations on two inputs
| Method : uses a case statement and an input flag to determine
|		which operation to perform
| Inputs : 	operandA	- first input of the arithmetic
| 				operandB	- second input of the arithmetic
|				command	- 2bit operation flag
| Output : 	result	- return value of the arithmetic
| Additional Comments : (Extras)
\*****************************************************************/

module MyALU(operandA, operandB, command, result);
  input [3:0] operandA, operandB;
  input [1:0] command;
  output reg [7:0] result;


  // Implementation
  always@(*)
  begin
    case(command)
      2'b00: result = operandA + operandB;	// addition
      2'b01: result = operandA - operandB;	// subtraction (A - B)
      2'b10: result = operandA * operandB;	// Multiplication
      2'b11: result = operandA / operandB;	// Integer division (A / B)
		default: result = 0;
    endcase
  end // always

endmodule
