`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bronson Garel
//           Kyle Wyckoff
//           Andrew Nguyen
//           Kenneth Vuong
// 
// Create Date: 02/12/2025 03:55:25 PM
// Design Name: 
// Module Name: AXI_Lite_Interface
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


module AXI_Lite_Interface(
    input clk,
    input reset,
    input readWrite,
    input [7:0] addr,
    input [7:0] data,
    output [7:0] out
    );
    
    bram br1 (.clk(clk), .reset(reset), .data(data), .readWrite(readWrite), .addr(addr), .out(out));
endmodule
