/* ***************************************************************\
| Name of program : hex7seg
| Author : Charles Heckel
| Date Created : 5/31/2018
| Date last updated : 5/31/2018
| Function : interpretes input signal as a hexadecimal number to
|		display
| Method : recieves 4bit input via main function, then sends power
|		to respective segments from a SSD
| Inputs : num		- 4bit binary signal
| Output : display- single seven-segment-display
| Additional Comments : (Extras)
\*****************************************************************/

module hex7seg(num, display);
  input [3:0] num;
  output reg [0:6] display;
  // Additional variables
  
  
  // Implementation
  // SSD uses negative logic (0 means power)
  always@(num)
  begin
    display = 7'b1111111; // all lights off
    // in the case of each number, 0-F ...
	 // ... light up each segment
    case(num)
	   4'h0: display = 7'b0000001;
	   4'h1: display = 7'b1001111;
	   4'h2: display = 7'b0010010;
	   4'h3: display = 7'b0000110;
	   4'h4: display = 7'b1001100;
	   4'h5: display = 7'b0100100;
	   4'h6: display = 7'b0100000;
	   4'h7: display = 7'b0001111;
	   4'h8: display = 7'b0000000;
	   4'h9: display = 7'b0001100;
	   4'hA: display = 7'b0001000;
	   4'hB: display = 7'b1100000;
	   4'hC: display = 7'b0110001;
	   4'hD: display = 7'b1000010;
	   4'hE: display = 7'b0110000;
	   4'hF: display = 7'b0111000;
		default: display = 7'bx;
    endcase
  end // always
  
  
endmodule
