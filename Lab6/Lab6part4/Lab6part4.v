/* ***************************************************************\
| Name of program : Lab6
| Author : Charles Heckel
| Date Created : 6/07/2018
| Date last updated : 6/07/2018
| Function : Scrolls the text "HELLO   " across the 8 SSDs on the
|		DE2-115 board
| Method : isntantiates 8 8-input Multiplexors (one for each SSD)
|		and receives output based on the timeing of the DE2-115 
|		board's internal clock.  The muxes recieve various inputs in
|		cascading order so all outputs contain a different letter. 
|		The outputs from the muxes are each given to a different
|		decoder which desplays a letter to the SSD.
|		A Clock-and-Bound system is used to prevent the text from
|		scrolling too quickly. 
| Inputs :	CLOCK_50	- DE2-115 board's internal clock. Drives the 
|		selector
|				SW			- single hardware switch on the DE2-115.
|		Drives the direction of the scrolling letters
| Output :	Hex7-3	- set of SSDs from the DE2-115 board.
|		Displays a letter based on a selected input
| Additional Comments : (Extras)
\*****************************************************************/

module Lab6part4(CLOCK_50, SW, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
	// variables
	parameter U = 3'b000;	// 'H' gets displayed if selected
	parameter V = 3'b001;	// 'E' gets displayed if selected
	parameter W = 3'b010;	// 'L' gets displayed if selected
	parameter X = 3'b010;	// 'L' gets displayed again if selected
	parameter Y = 3'b011;	// 'O' gets displayed if selected
	parameter A = 3'b100;	// '_' gets displayed if selected
	parameter B = 3'b100;	// '_' gets displayed again if selected
	parameter C = 3'b100;	// '_' gets displayed again if selected
	parameter bound = 18000000;		// arbitrary value (higher = slower output changes)
	reg [31:0] ClockCycle = 31'b0;	// max value is ~4.3bil, must be greater than bound
	input [17:17] SW;			// input signal from DE2-115 board, controls direction
	input CLOCK_50;			// input signal from DE2-115 board, controls selector
	output [0:6] HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	reg [2:0] selector;		// determines which letter gets output after mux array
	wire [2:0] outVal0, outVal1, outVal2, outVal3, outVal4, outVal5, outVal6, outVal7;	// gives mux output to Decoder
	
	
	// instantiation
	// one mux for each character, max of 8 due to finite SSDs on DE2-115 board
	// when selector == 0, first parameter is output
	Mux8to1 mux0(.inU(U), .inV(V), .inW(W), .inX(X), .inY(Y), .inA(A), .inB(B), .inC(C), .Sel(selector), .Out(outVal0));
	Mux8to1 mux1(.inU(V), .inV(W), .inW(X), .inX(Y), .inY(A), .inA(B), .inB(C), .inC(U), .Sel(selector), .Out(outVal1));
	Mux8to1 mux2(.inU(W), .inV(X), .inW(Y), .inX(A), .inY(B), .inA(C), .inB(U), .inC(V), .Sel(selector), .Out(outVal2));
	Mux8to1 mux3(.inU(X), .inV(Y), .inW(A), .inX(B), .inY(C), .inA(U), .inB(V), .inC(W), .Sel(selector), .Out(outVal3));
	Mux8to1 mux4(.inU(Y), .inV(A), .inW(B), .inX(C), .inY(U), .inA(V), .inB(W), .inC(X), .Sel(selector), .Out(outVal4));
	Mux8to1 mux5(.inU(A), .inV(B), .inW(C), .inX(U), .inY(V), .inA(W), .inB(X), .inC(Y), .Sel(selector), .Out(outVal5));
	Mux8to1 mux6(.inU(B), .inV(C), .inW(U), .inX(V), .inY(W), .inA(X), .inB(Y), .inC(A), .Sel(selector), .Out(outVal6));
	Mux8to1 mux7(.inU(C), .inV(U), .inW(V), .inX(W), .inY(X), .inA(Y), .inB(A), .inC(B), .Sel(selector), .Out(outVal7));
	
	// display selected letter to output SSD
	// one decoder for each mux, no more or less.
	// takes selected value from mux and interprets what letter to display on SSD
	Decoder dec0( .sel(outVal0) , .display(HEX7) );
	Decoder dec1( .sel(outVal1) , .display(HEX6) );
	Decoder dec2( .sel(outVal2) , .display(HEX5) );
	Decoder dec3( .sel(outVal3) , .display(HEX4) );
	Decoder dec4( .sel(outVal4) , .display(HEX3) );
	Decoder dec5( .sel(outVal5) , .display(HEX2) );
	Decoder dec6( .sel(outVal6) , .display(HEX1) );
	Decoder dec7( .sel(outVal7) , .display(HEX0) );
	
	
	// implementation
	// edge triggered sequential code section
	// Clock-and-Bound system for incrementing selector slowly
	always@(posedge CLOCK_50)
	begin
		ClockCycle = ClockCycle + 1 ; // increment clock cyle until it reaches the bound
		
		if(ClockCycle == bound && SW[17] == 1'b1)	// This style prevents delay when switching directions
		begin
			ClockCycle = 0; // reset count
			selector = selector+3'b1; // increment display shifter (shift left: H -> E -> L -> ...)
		end // if
		else if(ClockCycle == bound && SW[17] == 1'b0)
		begin
			ClockCycle = 0;
			selector = selector-3'b1; // decrement display shifter ( shift right: O -> L -> L -> ...)
		end // else if
  end //always
	
	
endmodule
