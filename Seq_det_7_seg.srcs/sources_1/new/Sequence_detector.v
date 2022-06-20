module seq_det(clk, rst, x, y);

input clk, rst, x;
output reg y;
reg [1:0] PS, NS;
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

always @(posedge clk or posedge rst)
    if(rst)
        PS <= S0;
    else 
        PS <= NS;

always @(posedge clk or posedge rst)
    if(rst)
        y <= 1'b0;
    else
        y <= ((PS == S1) & x) |  (PS == S2) | ((PS == S3) & x);

always @(*)
    begin
        case(PS)
            S0 : NS = x ? S1 : S0;
            S1 : NS = x ? S2 : S3;
            S2 : NS = x ? S2 : S3;
            S3 : NS = x ? S1 : S0;
        endcase
    end

endmodule
