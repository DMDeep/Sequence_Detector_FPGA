
module s_in(input clk,input rst, input x, output reg [3:0] out, input y);

always@(posedge clk or posedge rst)
    if(rst)
    out <= 0;
    else
    out <= {out[2:1], x, y};

endmodule
