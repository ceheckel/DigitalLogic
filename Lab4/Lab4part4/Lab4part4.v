/* ***************************************************************\
| Name of program : Lab4part4
| Author : Charles Heckel
| Date Created : 5/31/2018
| Date last updated : 5/31/2018
| Function : Displays a 4 digit hex clock using DE2-115's internal
|		clock and external SSDs
| Method : uses four instances of hex7seg (custom module) to
|		interpret a 16bit binary number as four 4bit clock values
| Inputs : 	CLOCK_50	- DE2-115 board's internal clock
| Output : 	HEX(0-4)	- SSDs on DE2-115 board
| Additional Comments : (Extras)
\*****************************************************************/

module Lab4part4(CLOCK_50, HEX0, HEX1, HEX2, HEX3);
  input CLOCK_50;
  output wire [0:6] HEX0, HEX1, HEX2, HEX3;
  parameter bound = 10000000;		// arbitrary value
  reg [31:0] ClockCycle = 32'b0; // 23bits is realistic, but i'm a CS major
  reg [15:0] DispClock = 16'b0;
  reg [3:0] modNum0, modNum1, modNum2, modNum3; // input link between main module and hex7seg
  
  // module instantiation
  // hex7seg is implemented elsewhere
  // instantiate one module for each digit on DE2-115
  hex7seg digit0( .num(modNum0), .display(HEX0) );
  hex7seg digit1( .num(modNum1), .display(HEX1) );
  hex7seg digit2( .num(modNum2), .display(HEX2) );
  hex7seg digit3( .num(modNum3), .display(HEX3) );
  
  
  // main Implementation
  // edge triggered sequential code section
  always@(posedge CLOCK_50)
  begin
    ClockCycle = ClockCycle+1; // increment clock cyle until it reaches the bound
	 if(ClockCycle == bound)
	 begin
	   ClockCycle = 0; // reset count
		DispClock = DispClock+16'b1; // increment display number
		
		// send each 4bit section to display digits
		modNum0 = DispClock[3:0];
		modNum1 = DispClock[7:4];
		modNum2 = DispClock[11:8];
		modNum3 = DispClock[15:12];
		
	 end // if
  end //always

endmodule
