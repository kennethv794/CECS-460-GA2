`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bronson Garel
//           Kyle Wyckoff
//           Andrew Nguyen
//           Kenneth Vuong
// 
// Create Date: 02/12/2025 06:08:28 PM
// Design Name: 
// Module Name: button_debouncer
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


module button_debouncer(
    input clk, reset,
    input button_in,
    output button_out
    );
    
    wire Q1, Q2;
    
    dff d1(.clk(clk),.D(button_in), .Q(Q1));
    dff d2(.clk(clk),.D(Q1), .Q(Q2));
    
    assign button_out = Q1 & ~Q2;
    
endmodule
