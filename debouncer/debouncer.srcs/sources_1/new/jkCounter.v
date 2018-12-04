`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2018 07:24:01 AM
// Design Name: 
// Module Name: jkCounter
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


module jkCounter(
    input clk,
    input incr,
    input rst,
    output reg [7:0] q
    );
    
    always @(posedge clk) begin
        if (rst)
            q  <= 0;
        else if (incr)
            q <= q + 1;
        end
    
endmodule

