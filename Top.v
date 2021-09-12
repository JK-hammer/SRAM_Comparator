///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: Top.v
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

//`timescale <time_units> / <precision>

module Top( clk, rst, d_i, we, rd, r_o);
input clk;
input rst;
input [31:0] d_i;
input we;
input rd;
output r_o;

wire cs = 1'b1;
wire [31:0] d1_o;
wire [31:0] d2_o;

reg[7:0] addr;
always@(posedge clk or posedge rst)begin
    if(rst)begin
        addr <= 8'b0;
    end
    else begin
        if(addr == 8'b11111111)begin
        addr <= 8'b0;
        end
        else begin
        addr <= addr + 8'b1;
        end
    end
end


//<statements>
SRAM SRAM_u1(
                .dataIn(d_i),
                .dataOut(d1_o),
                .Addr(addr), 
                .CS(cs), 
                .WE(we), 
                .RD(rd), 
                .Clk(clk)
);

SRAM SRAM_u2(
                .dataIn(d_i),
                .dataOut(d2_o),
                .Addr(addr), 
                .CS(cs), 
                .WE(we), 
                .RD(rd), 
                .Clk(clk)
);

Comparator Comparator_u1(
                .clk(clk),
                .rst(rst),
                .d1_i(d1_o),
                .d2_i(d2_o),
                .result_o(r_o)
);
endmodule

