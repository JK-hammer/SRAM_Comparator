//////////////////////////////////////////////////////////////////////
// Created by Microsemi SmartDesign Sun Sep 12 16:21:08 2021
// Testbench Template
// This is a basic testbench that instantiates your design with basic 
// clock and reset pins connected.  If your design has special
// clock/reset or testbench driver requirements then you should 
// copy this file and modify it. 
//////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: SRAM_Comparator_test.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::ProASIC3E> <Die::A3PE1500> <Package::208 PQFP>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

`timescale 1ns/100ps

module SRAM_Comparator_test;

parameter SYSCLK_PERIOD = 25;// 10MHZ

reg SYSCLK;
reg NSYSRESET;

reg [31:0]d_i;
reg [31:0]  i;
reg we;
reg rd;
wire r_o;

initial
begin
    SYSCLK = 1'b0;
    NSYSRESET = 1'b1;
    d_i = 32'b0;
    we = 1'b0;
    rd = 1'b0;
end

//////////////////////////////////////////////////////////////////////
// Reset Pulse
//////////////////////////////////////////////////////////////////////
initial
begin
    #(SYSCLK_PERIOD * 10 )

    NSYSRESET = 1'b0;
   
    d_i = 32'b0;
    we = 1'b0;
    rd = 1'b0;

    for(i=0;i < 255;i = i + 8'b1)begin
    #SYSCLK_PERIOD
    d_i = i;
    we = 1'b1;
    rd = 1'b0;
    end

    #(SYSCLK_PERIOD * 10 )

    for(i=0;i < 256;i = i + 8'b1)begin
    #SYSCLK_PERIOD;
    d_i = 1'b0;
    we = 1'b0;
    rd = 1'b1;
    end
end


//////////////////////////////////////////////////////////////////////
// Clock Driver
//////////////////////////////////////////////////////////////////////
always @(SYSCLK)
    #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;


//////////////////////////////////////////////////////////////////////
// Instantiate Unit Under Test:  Top
//////////////////////////////////////////////////////////////////////
Top Top_0 (
    // Inputs
    .clk(SYSCLK),
    .rst(NSYSRESET),
    .d_i(d_i),
    .we(we),
    .rd(rd),

    // Outputs
    .r_o( r_o)

    // Inouts

);

endmodule

