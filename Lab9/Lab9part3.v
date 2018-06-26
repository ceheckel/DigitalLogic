/* ***************************************************************************\
| Name of program : Lab9
| Author : Charles Heckel
| Date Created : 6/26/2018
| Date last updated : 6/26/2018
| Function : mimics a state machine
| Method : generated through Quartus 2 state machine code generator.  This 
|		module mimics a state machine with 6 states each having two transitions
|		Transitions are denoted by inputs, in0 and in1. To prevent excessive
|		state transfers, the input data is gated and required the rising edge
|		edge of a clock to trigger.  The reset function is asynchronous and 
|		does not require the clock.
| Inputs : reset  - 1bit signal to reset the state machine to state A
|          clock  - user defined clock cycle used to gate the transitions
|          in0    - represents an input of 0 for the transitions
|          in1    - represents an input of 1 for the transitions
| Output : outHex - 4bit encoded value created based on current state of the 
|		machine.  value will be sent to a decoder for display on SSD
| Additional Comments : (Extras)
\*****************************************************************************/
`timescale 1ns/1ns

module Lab9part3 (
    reset,clock,in0,in1,
    outHex[3:0]);

    input reset;
    input clock;
    input in0;
    input in1;
    tri0 reset;
    tri0 in0;
    tri0 in1;
    output [3:0] outHex;
    reg [3:0] outHex;
    reg [4:0] fstate;
    reg [4:0] reg_fstate;
    parameter A=0,B=1,C=2,D=3,E=4,F=5;

    always @(posedge clock or negedge reset)
    begin
        if (~reset) begin
            fstate <= A;
        end
        else begin
            fstate <= reg_fstate;
        end
    end

    always @(fstate or in0 or in1)
    begin
        outHex <= 4'b0000;
        case (fstate)
            A: begin
                if ((in0 & ~(in1)))
                    reg_fstate <= B;
                else if ((in1 & ~(in0)))
                    reg_fstate <= D;
                // Inserting 'else' block to prevent latch inference
                else
                    reg_fstate <= A;

                outHex <= 4'b0001;
            end
				// transitions modified in part 3
				// ORIGINAL: zero transition goes to state C
				// ORIGINAL: ones transition goes to state D
				// ORIGINAL: void transition goes to state B
				// MODIFIED: zero transition goes to state C
				// MODIFIED: ones transition goes to state F
				// MODIFIED: void transition goes to state B
            B: begin
                if ((in0 & ~(in1)))
                    reg_fstate <= C;
                else if ((in1 & ~(in0)))
                    reg_fstate <= F;
                // Inserting 'else' block to prevent latch inference
                else
                    reg_fstate <= B;

                outHex <= 4'b0010;
            end
            C: begin
                if ((in1 & ~(in0)))
                    reg_fstate <= D;
                else if ((in0 & ~(in1)))
                    reg_fstate <= C;
                // Inserting 'else' block to prevent latch inference
                else
                    reg_fstate <= C;

                outHex <= 4'b0011;
            end
            D: begin
                if ((in1 & ~(in0)))
                    reg_fstate <= E;
                else if ((in0 & ~(in1)))
                    reg_fstate <= B;
                // Inserting 'else' block to prevent latch inference
                else
                    reg_fstate <= D;

                outHex <= 4'b0100;
            end
            E: begin
                if ((in0 & ~(in1)))
                    reg_fstate <= B;
                else if ((in1 & ~(in0)))
                    reg_fstate <= E;
                // Inserting 'else' block to prevent latch inference
                else
                    reg_fstate <= E;

                outHex <= 4'b0101;
            end
			// NEW STATE: transition in from state B on one input
			// NEW STATE: transition out to state B on zero input
			// NEW STATE: transition out to state F on one input 
            F: begin
                if ((in0 & ~(in1)))
                    reg_fstate <= B; // go to state B on zero transition
                else if ((in1 & ~(in0)))
                    reg_fstate <= F; // stay if state F on one transition
                // Inserting 'else' block to prevent latch inference
                else
                    reg_fstate <= F; // stay in state F is anything else happens

                outHex <= 4'b0110;
            end
            default: begin
                outHex <= 4'bxxxx;
                $display ("Reach undefined state");
            end
        endcase
    end
endmodule // Lab9part2
