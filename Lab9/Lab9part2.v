// Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus Prime License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// Generated by Quartus Prime Version 16.0.0 Build 211 04/27/2016 SJ Standard Edition
// Created on Tue Jun 26 14:14:26 2018

// synthesis message_off 10175

`timescale 1ns/1ns

module Lab9part2 (
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
    parameter A=0,B=1,C=2,D=3,E=4;

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
            B: begin
                if ((in0 & ~(in1)))
                    reg_fstate <= C;
                else if ((in1 & ~(in0)))
                    reg_fstate <= D;
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
            default: begin
                outHex <= 4'bxxxx;
                $display ("Reach undefined state");
            end
        endcase
    end
endmodule // Lab9part2
