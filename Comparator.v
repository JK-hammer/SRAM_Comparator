module Comparator( clk, rst, d1_i, d2_i, result_o );
input               clk;
input               rst;
input [31:0]        d1_i;
input [31:0]        d2_i;
output reg          result_o;
//<statements>
always @(posedge clk or posedge rst) begin
    if (rst) begin
        result_o <= 1'b0;
    end
    else begin
        if (d1_i == d2_i) begin
        result_o <= 1'b0;
        end
        else if (d1_i != d2_i) begin
        result_o <= 1'b1;
        end
    end
end

endmodule