`timescale 1ns / 1ps

module Seven_Segment(clk, rst, Anode, LED_out, x);

parameter width = 27;
parameter N = 100000000;
input x;
input clk, rst;
output reg [3:0] Anode;
output reg [6:0] LED_out;
reg [19:0] r_count;
wire [1:0] LED_activate;
reg [3:0] LED_BCD;
wire y;
wire [3:0] disp_num;
reg [width-1:0] slow_clk;
wire s_clk;

seq_det S1(s_clk, rst, x, y);

s_in S2(s_clk, rst, x, disp_num, y);

//generate slow clock
always @(posedge clk)
    begin
        if(rst)
            slow_clk <= 0;
        if(slow_clk == N-1)
            slow_clk <= 0;
        else
            slow_clk <= slow_clk+1;
        end
assign s_clk = slow_clk[width-1];

always @(posedge clk)
    begin
        if(rst == 1)
            r_count <= 0;
        else 
            r_count <= r_count + 1;
    end

assign LED_activate = r_count[19:18];

always @(*)
    begin
        case(LED_activate)
        2'b00:
        begin
        Anode = 4'b0111;
        LED_BCD = disp_num[3];
        end
        
        2'b01:
        begin
        Anode = 4'b1011;
        LED_BCD = disp_num[2];
        end
        
        2'b10:
        begin
        Anode = 4'b1101;
        LED_BCD = disp_num[1];
        end
        
        2'b11:
        begin
        Anode = 4'b1110;
        LED_BCD = disp_num[0];
        end
        endcase
end


always @(*)
    begin
        case(LED_BCD)
        4'b0000: LED_out = 7'b0000001;
        4'b0001: LED_out = 7'b1001111;
        default: LED_out = 7'b0000001;
        endcase
    end


endmodule


