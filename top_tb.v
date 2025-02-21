`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bronson Garel
//           Kyle Wyckoff
//           Andrew Nguyen
//           Kenneth Vuong
// 
// Create Date: 02/11/2025 07:51:41 PM
// Design Name: 
// Module Name: top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_tb(
    );
    reg[3:0] data_tb;
    reg[1:0] bufferIndex_tb;
    reg clk_tb, reset_tb, submit_tb;
    wire[3:0] out_tb;
    wire[2:0] status_tb;
    integer i;
    
    localparam period = 4;
    
    top uut(.clk(clk_tb), .mode(mode_tb), .reset(reset_tb), .data(data_tb), .reset(reset_tb), .out(out_tb));
    
    initial begin
        clk_tb = 0;
        forever begin
            clk_tb = ~clk_tb;
            #(period/4);
        end
    end
    initial begin
        for(i = 0; i < 2048; i = i + 1) begin
            {data_tb, submit_tb, bufferIndex_tb, reset_tb} = i;
            #period;
        end
    end
endmodule
