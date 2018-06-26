/* ***************************************************************\
| Name of program : Lab7
| Author : Charles Heckel
| Date Created : 6/12/2018
| Date last updated : 6/12/2018
| Function : clock driven counter displays excess4 biased 
|		hexidecimal values to DE2-115 board
| Method : uses a modified hex7seg to decode a 4bit input value 
|		into an excess4 biased output for the SSDs
| Inputs : CLOCK_50 - DE2-115 board's internal clock
| Output : HEX0,1,7 - DE2-115 board's seven-segment-displays
|          LEDR     - DE2-115 board's external red LEDs
|          LEDG     - DE2-115 board's external green LEDs
| Additional Comments : (Extras)
\*****************************************************************/
module Lab7part2(CLOCK_50, HEX0, HEX1, HEX7, LEDR, LEDG);
  // variables
  parameter bound = 16000000; // upper bound for clock, triggers display change
  
  input CLOCK_50;
  // HEX0 displays excess4 biased value
  // HEX1 displays sign symbol
  // HEX7 displays counter in hexadecimal
  output [0:6]  HEX0, HEX1, HEX7;
  output [17:0] LEDR; // powered when display value is greater than bias (positive)
  output [7:0]  LEDG; // powered when display value is less than bias (negative)
  
  // ClockCycle increments once every hardware clock cycle until the bound is reached
  // excessVal is the counter that will be displayed by the SSDs
  // redpower represents the set of 18 red LEDs on the board, all start with power
  // grepower represents the set of 8 green LEDs on the board, all start with no power
  reg [23:0] ClockCycle;
  reg [3:0]  excessVal = 4'b0;
  reg [17:0] redpower = 18'd262143;
  reg [7:0]  grepower = 8'd0;
  
  
  // instantiation
  excess7seg digit0(excessVal, HEX0);				// display excess-4 magnitude
  excess7seg digit7(excessVal-4'b0100, HEX7);	// display unsigned hex value
  
  
  // implementation
  // display sign bit
  // connect power wires to output LEDs
  assign HEX1 = ((excessVal >= 4'b0100) ? 7'b1111111 : 7'b1111110);
  assign LEDR = redpower;
  assign LEDG = grepower;
  
  // edge triggered sequential code section
  // Clock-and-Bound system for incrementing display slowly
  always@(posedge CLOCK_50)
  begin
    ClockCycle = ClockCycle + 24'b1; // increment clock cyle until it reaches the bound

    if(ClockCycle == bound)
    begin
      ClockCycle = 0; // reset clock counter
      excessVal = excessVal + 1'b1; // increment display value
	  
	  
      // light up LEDs according to sign bit
      if(excessVal >= 4'b0100)  // if display value is positive ...
      begin
        redpower = 18'b0;       // ... turn off all red LEDs
        grepower = 8'b11111111; // ... turn on all green LEDs
      end // if
      else                      // if display value is not positive ...
      begin
        redpower = 18'd262143;  // ... turn on all red LEDs
        grepower = 8'b0;        // ... turn off all green LEDs
      end // end else
    end // if(ClockCycle == bound)
  end //always

endmodule
