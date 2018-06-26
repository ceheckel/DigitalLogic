/* ***************************************************************************\
| Name of program : Lab8
| Author : Charles Heckel
| Date Created : 6/19/2018
| Date last updated : 6/19/2018
| Function : a D-Flipflop with positive edge clock trigger and asynchronous 
|		active low reset with the purpose of counting
| Method : Non-blocking is interpreted from the presence of the "<=" to allow
|		for the execution of a line of code independent of other lines.
| Inputs : clock - input signal that simulates a clock cycle
|          reset - input signal that simulates a reset cycle
|          E     - input signal that allows the output to change
| Output : Q     - 16bit output signal that corresponds to the counter's value
| Additional Comments : (Extras)
\*****************************************************************************/
module Lab8part4(clock, reset, E, Q);
  // variables
  input clock, reset, E;
  // 'E' represents the data input which takes the role of the enable
  output reg [15:0] Q = 16'b0;
  
  
  // implementation
  always@(posedge clock or negedge reset)
  begin
    if(reset == 0) // reset is active low
	   Q <= 16'b0;
    else if(E == 1) // enable is active high
	   Q <= Q + 16'b1;
  end // always
  
endmodule
