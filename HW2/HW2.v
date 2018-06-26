/* ***************************************************************\
| Name of program : HW2
| Author : Charles Heckel
| Date Created : 6/04/2018
| Date last updated : 6/04/2018
| Function : Runs the code for each question from Homework 2
| Method : the main module creates instances of other modules
|		defined in this project
| Inputs : no inputs
| Output : q#out	- 64bit register corresponding to the question
|		of the same number.  some registers have results from
|		multiple tests
| Additional Comments : (Extras)
\*****************************************************************/

module HW2(input [7:0] stdin, output [23:0] stdout);
  // Variables
  
  // Implementation
/*
  // Question 1
  IsEven test01(4'b1110, stdout[0]);
  IsEven test02(4'b0101, stdout[1]);
/*

  // Question 2
  MajorityDetector test03(8'b00000000, stdout[0]); // 0
  MajorityDetector test04(8'b11111111, stdout[1]); // 1
  MajorityDetector test05(8'b01010101, stdout[2]); // 0
  MajorityDetector test06(8'b01100111, stdout[3]); // 1
/*

  // Question 3
  MajorityDetector2 test07(4'b0000, 4'b0000, 4'b0010, stdout[3:0]);		// 0000
  MajorityDetector2 test08(4'b0100, 4'b0001, 4'b0100, stdout[7:4]);		// 0100
  MajorityDetector2 test09(4'b0000, 4'b0111, 4'b0111, stdout[11:8]);		// 0111
  MajorityDetector2 test10(4'b0000, 4'b0101, 4'b1111, stdout[15:12]);	// 1111
/*

  // Question 4
  Reverser8 test11(8'b00110101, stdout[7:0]);		// 10101100
  Reverser8 test12(8'b11110000, stdout[15:8]);	// 00001111
/*

  // Question 5
  Reverser64 test13(64'hfedcba9876543210, q5out[63:0]);	// 1e6a2c48
/*

  // Question 6
  MultipleOf3or5 test14(6'd60, stdout[0], stdout[1]);	// 1 and 1
  MultipleOf3or5 test15(6'd43, stdout[2], stdout[3]);	// 0 and 0
  MultipleOf3or5 test16(6'd12, stdout[4], stdout[5]);	// 1 and 0
  MultipleOf3or5 test17(6'd20, stdout[6], stdout[7]);	// 0 and 1
/*

  // Question 7
  MyALU test18(4'b0101, 4'b0001, 2'b00, stdout[3:0]);		// 0110
  MyALU test19(4'b0101, 4'b0001, 2'b01, stdout[7:4]);		// 0100
  MyALU test20(4'b0101, 4'b0010, 2'b10, stdout[11:8]);	// 1010
  MyALU test21(4'b1010, 4'b0010, 2'b11, stdout[15:12]);	// 0101
/**/

  // Question 7 with stdin and stdout
  MyALU test18(stdin[7:4], stdin[3:0], 2'b00, stdout[3:0]);		// results may vary
  MyALU test19(stdin[7:4], stdin[3:0], 2'b01, stdout[7:4]);		// results may vary
  MyALU test20(stdin[7:4], stdin[3:0], 2'b10, stdout[15:8]);	// results may vary
  MyALU test21(stdin[7:4], stdin[3:0], 2'b11, stdout[23:16]);	// results may vary
  
endmodule
