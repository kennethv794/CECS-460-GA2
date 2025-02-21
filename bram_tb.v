`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bronson Garel
//           Kyle Wyckoff
//           Andrew Nguyen
//           Kenneth Vuong
// 
// Create Date: 02/13/2025 06:53:38 PM
// Design Name: 
// Module Name: bram_tb
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


module bram_tb();
    reg clk_tb, readWrite_tb;
    reg [7:0] data_tb, addr_tb;
    wire [7:0] out_tb;
    integer i;
    localparam period = 2;
    bram uut(.clk(clk_tb),.data(data_tb),
            .readWrite(readWrite_tb),
            .addr(addr_tb),.out(out_tb));
    
    initial begin
        clk_tb = 0;
        forever begin
            clk_tb = ~clk_tb;
            #1;
        end
    end
    
    
    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            readWrite_tb = 1;
            addr_tb = i;
            data_tb = i;
            #period;
        end
        for (i = 0; i < 256; i = i + 1) begin
            data_tb = 0;
            readWrite_tb = 0;
            addr_tb = i;
            #period;
        end
    end
endmodule
