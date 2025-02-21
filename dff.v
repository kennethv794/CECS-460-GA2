`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bronson Garel
//           Kyle Wyckoff
//           Andrew Nguyen
//           Kenneth Vuong
// 
// Create Date: 02/13/2025 06:12:14 AM
// Design Name: 
// Module Name: dff
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


module dff(
    input D,
    input clk,
    output Q
    );
    
    reg Q;
    
    always @ (posedge clk) begin
        Q <= D;
    end
endmodule
