`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bronson Garel
//           Kyle Wyckoff
//           Andrew Nguyen
//           Kenneth Vuong
// 
// Create Date: 02/11/2025 07:27:06 PM
// Design Name: 
// Module Name: top
// Project Name: assignment 2
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


module top(
    input clk,
    input submit,
    input mode,
//    input reset,
    input [1:0] bufferIndex,
    input [3:0] data,
    output reg [3:0] out,
    output reg [2:0] status
    );
    reg [1:0] currentMode;
    reg reset;
    wire newMode;
    wire newSubmit;
    wire [1:0] newBufferIndex;
    reg [7:0] buffer;
    reg readWrite;
    reg [7:0] addrBits, dataBits;
    wire [7:0] outputBits;
    button_debouncer bd1 (.clk(clk), .reset(reset), .button_in(bufferIndex[0]), .button_out(newBufferIndex[0]));
    button_debouncer bd2 (.clk(clk), .reset(reset), .button_in(bufferIndex[1]), .button_out(newBufferIndex[1]));
    button_debouncer bd3 (.clk(clk), .reset(reset), .button_in(mode), .button_out(newMode));
    button_debouncer bd4 (.clk(clk), .reset(reset), .button_in(submit), .button_out(newSubmit));
    AXI_Lite_Interface ax1 (.clk(clk), .reset(reset), .readWrite(readWrite), .addr(addrBits), .data(dataBits), .out(outputBits));
    
    initial begin
        out <= 0;
    end
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            buffer <= 0;
            currentMode <= 0;
        end
        else if (newBufferIndex == 2'b10) begin
            buffer <= (buffer & 8'b00001111) | (data << 4);
            out <= outputBits[7:4];
//            out <= addrBits[7:4];
//            out <= dataBits[7:4];
//            out <= buffer[7:4];
        end
        else if (newBufferIndex == 2'b01) begin
            buffer <= (buffer & 8'b11110000) | data;
            out <= outputBits[3:0];
//            out <= addrBits[3:0];
//            out <= dataBits[7:4];
//            out <= buffer[3:0];
        end
        else if (newSubmit) begin
            case (currentMode)
                1:begin
                    addrBits <= buffer;
                end
                2: begin
                    readWrite <= 0;
                end
                3: begin
                    dataBits <= buffer;
                    readWrite <= 1;
                end
                default:
                    readWrite <= 0;
            endcase
            buffer <= 0;
        end
        else if (newMode) begin
            if (currentMode < 3)
                currentMode <= currentMode + 1;
            else
                currentMode <= 0;
        end
        case (currentMode)
            1: status <= 3'b001;
            2: status <= 3'b010;
            3: status <= 3'b100;
            default: status <= 3'b000;
        endcase
    end
endmodule
