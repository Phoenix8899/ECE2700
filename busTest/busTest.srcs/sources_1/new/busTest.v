`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2018 10:26:53 AM
// Design Name: 
// Module Name: busTest
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


module busTest(
    input clk,
    input [3:0] sw,
    output reg [4:0] led
    );
    
    reg [1:0] outer;
    `define outer[0] {W3,W2,W1,W0}
    `define outer[1] {X3,X2,X1,X0}
    `define outer[2] {Y3,Y2,Y1,Y0}
    `define outer[3] {Z3,Z2,Z1,Z0}
    
    always @(posedge clk) begin
        outer[0] <= sw;
        outer[1] <= outer[1] + outer[0];
        outer[2] <= outer[1] - outer[0];
        outer[3] <= outer[1] & outer[2];
        led <= outer[3];
    end
    endmodule
