`timescale 1ns / 1ps

module tb();

wire y;
reg clk, rst, x;
seq_det uut(clk, rst, x, y);

initial 
begin
clk = 0;
forever 
#5 clk = ~clk;
end


initial 
begin
x = 1'b0;
rst = 1'b1;
#10 rst = 1'b0;

#3 x = 1'b0;
#10 x = 1'b0;
#10 x = 1'b0;
#10 x = 1'b1;
#10 x = 1'b1;
#10 x = 1'b0;
#10 x = 1'b1;
#10 x = 1'b0;
#10 x = 1'b0;
#10 x = 1'b1;
#10 x = 1'b1;
#10 x = 1'b1;
#10 x = 1'b0;
#10 x = 1'b0;
#10 x = 1'b0;
#10 x = 1'b0;
#10 x = 1'b1;
#10 x = 1'b0;
#10 x = 1'b1;
#10
$finish;



end




endmodule
