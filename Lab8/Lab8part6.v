/* ***************************************************************************\
| Name of program : Lab8
| Author : Charles Heckel
| Date Created : 6/19/2018
| Date last updated : 6/20/2018
| Function : displays two register values, one affected by input values.  The
|		other affected by the transfer signal
| Method : uses a D-flipflop to create a synchronized data transfer and an
|		asynchronous reset of the data.  Also uses hex7seg to display the output
|		signals to the SSDs on the DE2-115 board.
| Inputs : Breg - 16bit input signals from DE2-115 board's hardware switches
|          KEY  - set of push key signals from the board. does reset/transfer
| Output : HEX  - set of SSD signals from board's hardware. displays output
| Additional Comments : (Extras)
\*****************************************************************************/
module Lab8part6(
  input [15:0] Breg, // input signal from hardware switches
  input [1:0] KEY, // KEY[0] is reset, KEY[1] is clock cycle
  output [0:6] HEX0, // Seven-Segment Display
  output [0:6] HEX1,
  output [0:6] HEX2,
  output [0:6] HEX3,
  output [0:6] HEX4,
  output [0:6] HEX5,
  output [0:6] HEX6,
  output [0:6] HEX7);
  // variables
  reg  [15:0] Areg = 16'b0;
  
  
  // instantiation
  hex7seg Bcount0(Breg[3:0]  , HEX0);
  hex7seg Bcount1(Breg[7:4]  , HEX1);
  hex7seg Bcount2(Breg[11:8] , HEX2);
  hex7seg Bcount3(Breg[15:12], HEX3);
  hex7seg Acount0(Areg[3:0]  , HEX4);
  hex7seg Acount1(Areg[7:4]  , HEX5);
  hex7seg Acount2(Areg[11:8] , HEX6);
  hex7seg Acount3(Areg[15:12], HEX7);
  
  
  // implementation
  always@(KEY, Breg)
  begin 
    if(KEY[0] == 0) // reset counter
    begin
	   Areg = 16'b0;
    end
    else if(KEY[1] == 0)
	 begin
	   Areg = Breg; // value of A is determined by input during key stroke
	 end // if-else
  end // always
  
endmodule
