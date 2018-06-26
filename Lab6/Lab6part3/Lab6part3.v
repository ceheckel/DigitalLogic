/* ***************************************************************\
| Name of program : Lab6
| Author : Charles Heckel
| Date Created : 6/07/2018
| Date last updated : 6/07/2018
| Function : Displays the word "HELLO" to the SSDs on the DE2-115
|		and shifts the letters based on input signals
| Method : instantiates 5 5-input muxes (one for each letter) to
|		determine which letter is displayed on a particular SSD
|		then sends the output to the decoder
| Inputs : 	SW		- set of input signals from the DE2-115 board
| Output :	HEX7-3	- set of output signals to the DE2-115 SSDs
| Additional Comments : (Extras)
\*****************************************************************/

module Lab6part3(SW, HEX7, HEX6, HEX5, HEX4, HEX3);
	// variables
	parameter U = 3'b000;	// 'H' gets displayed
	parameter V = 3'b001;	// 'E' gets displayed
	parameter W = 3'b010;	// 'L' gets displayed
	parameter X = 3'b010;	// 'L' gets displayed again
	parameter Y = 3'b011;	// 'O' gets displayed
	input [17:15] SW;
	output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3;
	reg [2:0] selector;
	wire [2:0] outVal0, outVal1, outVal2, outVal3, outVal4;
	
	
	// instantiation
	// one mux for each character, max of 8 due to finite SSDs on DE2-115 board
	// when selector == 0, first parameter is output
	Mux5to1 mux0(.inU(U), .inV(V), .inW(W), .inX(X), .inY(Y), .Sel(SW[17:15]), .Out(outVal0));
	Mux5to1 mux1(.inU(V), .inV(W), .inW(X), .inX(Y), .inY(U), .Sel(SW[17:15]), .Out(outVal1));
	Mux5to1 mux2(.inU(W), .inV(X), .inW(Y), .inX(U), .inY(V), .Sel(SW[17:15]), .Out(outVal2));
	Mux5to1 mux3(.inU(X), .inV(Y), .inW(U), .inX(V), .inY(W), .Sel(SW[17:15]), .Out(outVal3));
	Mux5to1 mux4(.inU(Y), .inV(U), .inW(V), .inX(W), .inY(X), .Sel(SW[17:15]), .Out(outVal4));
	
	// display selected letter to output SSD
	// one decoder for each mux, no more or less.
	// takes selected value from mux and interprets what letter to display on SSD
	Decoder dec0( .sel(outVal0) , .display(HEX7) );
	Decoder dec1( .sel(outVal1) , .display(HEX6) );
	Decoder dec2( .sel(outVal2) , .display(HEX5) );
	Decoder dec3( .sel(outVal3) , .display(HEX4) );
	Decoder dec4( .sel(outVal4) , .display(HEX3) );
	
	
endmodule
