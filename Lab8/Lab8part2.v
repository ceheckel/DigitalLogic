/* ***************************************************************************\
| Name of program : Lab8
| Author : Charles Heckel
| Date Created : 6/19/2018
| Date last updated : 6/19/2018
| Function : a gated D latch (created from gated SRL in part 1)
| Method : (see method for part 1) adds a safety precaution ("D") to prevent
|		an input set of similar values.  i.e. R=1 and S=1 does not occur
| Inputs : Clk - input clock for latch (not necessarily hardware clock)
|          D   - 1bit input signal that composes S and R
| Output : Q   - 1bit output signal 
| Additional Comments : (Extras)
\*****************************************************************************/
module Lab8part2(Clk, D, Q);
  // variables
  input Clk, D;
  output Q;
  wire R, S, R_g, S_g, Qa, Qb;
  // R_g is the R input when the clock is high
  // S_g is the S input when the clock is high
  // input D determines the values of R and S
  
  // "/* synthesis keep */" after "Qb" and before the line delimiter lets the 
  // RTL viewer see the internal variables, R_g and S_g


  // implementation
  // assign single input D to input set of SRL
  assign S = D;
  assign R = ~D;
  
  // send outputs to SRL only when clock is high
  assign S_g = ~(S & Clk);
  assign R_g = ~(R & Clk);

  // setup standard SRL circuit
  assign Qa = ~(S_g & Qb);
  assign Qb = ~(R_g & Qa);
  
  // final output of D-latch
  assign Q  = Qa;


endmodule
