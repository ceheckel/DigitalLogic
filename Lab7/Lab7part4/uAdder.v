/* ***************************************************************************\
| Name of program : Lab7
| Author : Charles Heckel
| Date Created : 6/12/2018
| Date last updated : 6/12/2018
| Function : Ripple carry adder designed from 8 full adders
| Method : instantiates a full adder for each input bit.  The carry in for the
|		first bit is a zero and the carry out is connected to the following 
|		carry in.  carry out on the last adder is ignored.
| Inputs : inA - 8bit input to be added with inB
|          inB - 8bit input to be added with inA
| Output : sum - 8 bit output, sum of inA and inB.  Overflow is not handled.
| Additional Comments : (Extras)
\*****************************************************************************/
module uAdder(inA, inB, sum);
  // variables
  input [7:0] inA, inB;
  output[7:0] sum;
  wire  [7:0] carry;
  
  
  // instantiation
  FA adder0(1'b0    , inA[0], inB[0], carry[0], sum[0]);
  FA adder1(carry[0], inA[1], inB[1], carry[1], sum[1]);
  FA adder2(carry[1], inA[2], inB[2], carry[2], sum[2]);
  FA adder3(carry[2], inA[3], inB[3], carry[3], sum[3]);
  FA adder4(carry[3], inA[4], inB[4], carry[4], sum[4]);
  FA adder5(carry[4], inA[5], inB[5], carry[5], sum[5]);
  FA adder6(carry[5], inA[6], inB[6], carry[6], sum[6]);
  FA adder7(carry[6], inA[7], inB[7], carry[7], sum[7]);
  
  
  // implementation
  // carry in and out are neglegible on fixed size adder
  
  
endmodule
