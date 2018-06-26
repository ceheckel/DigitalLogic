/* ***************************************************************\
| Name of program : Lab7
| Author : Charles Heckel
| Date Created : 5/31/2018
| Date last updated : 6/12/2018
| Function : interpretes input signal as a hexadecimal number to
|		display with an excess-4 bias
| Method : recieves 4bit input, then sends power to respective 
|		segments from a SSD
| Inputs : num     - 4bit binary signal
| Output : display - single seven-segment-display on DE2-115 board
| Additional Comments : (Extras)
\*****************************************************************/

module excess7seg(num, display);
  input [3:0] num;
  output reg [0:6] display;
  // Additional variables
  
  
  // Implementation
  // SSD uses negative logic (0 means power)
  always@(num)
  begin
    display = 7'b1111111;	// all lights off
    // in the case of each number, (-4) - B ...
    // ... light up each segment
    case(num)
      4'b0000: display = 7'b1001100;	// -4
      4'b0001: display = 7'b0000110;	// -3
      4'b0010: display = 7'b0010010;	// -2
      4'b0011: display = 7'b1001111;	// -1
      4'b0100: display = 7'b0000001;	// 0
      4'b0101: display = 7'b1001111;	// 1
      4'b0110: display = 7'b0010010;	// 2
      4'b0111: display = 7'b0000110;	// 3
      4'b1000: display = 7'b1001100;	// 4
      4'b1001: display = 7'b0100100;	// 5
      4'b1010: display = 7'b0100000;	// 6
      4'b1011: display = 7'b0001111;	// 7
      4'b1100: display = 7'b0000000;	// 8
      4'b1101: display = 7'b0001100;	// 9
      4'b1110: display = 7'b0001000;	// A
      4'b1111: display = 7'b1100000;	// B
      default: display = 7'bxxxxxxx;
    endcase
  end // always

endmodule
