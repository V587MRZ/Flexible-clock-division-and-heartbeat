`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2021 12:47:20 PM
// Design Name: 
// Module Name: overflow_clock_divider
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


module overflow_clock_divider

(
    input wire clk,
    input wire enable,
    input wire reset,
    output reg dividedClk);
    //output wire beat);
    parameter integer THRESHOLD = 50_000_000;
    reg [63:0] counter;
    always @(posedge clk) begin
if (reset || counter >= THRESHOLD-1) begin
counter <= 64'd0;
end else if (enable == 1) begin
counter <= counter + 1'b1;
end
else if (counter <= 0.5*THRESHOLD -1) begin
dividedClk = 1'b1; end
else if (THRESHOLD-1>= counter >= 0.5*THRESHOLD-1) begin
dividedClk = 1'b0; end
end

/*
always @(posedge clk) begin
if (reset == 1) begin
 dividedClk <= 1'b0;
 end else if (counter >= THRESHOLD-1) begin
 dividedClk <= ~dividedClk;
 end
 end*/
 endmodule
