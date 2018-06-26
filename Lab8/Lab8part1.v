/* ***************************************************************************\
| Name of program : Lab8
| Author : Charles Heckel
| Date Created : 6/19/2018
| Date last updated : 6/19/2018
| Function : a gated SR latch
| Method : module uses combinational logic to create a standard Set/Reset Latch
| Inputs : Clk - input clock for latch (not necessarily hardware clock)
|          R   - input corresponding to the reset signal
|          S   - input corresponding to the set signal
| Output : Q   - output of the SR latch 
| Additional Comments : (Extras)
\*****************************************************************************/
module Lab8part1(Clk, R, S, Q);
  // variables
  input Clk, R, S;
  output Q;
  wire R_g, S_g, Qa, Qb;
  // R_g is the R input when the clock is high
  // S_g is the S input when the clock is high
  
  // "/* synthesis keep */" after "Qb" and before the line delimiter lets the 
  // RTL viewer see the internal variables, R_g and S_g


  // implementation
  // send outputs to SRL only when clock is high
  assign R_g = R & Clk;
  assign S_g = S & Clk;

  // setup standard SRL circuit
  assign Qa = ~(R_g | Qb);
  assign Qb = ~(S_g | Qa);
  assign Q  = Qa;


endmodule
