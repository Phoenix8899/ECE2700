`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 10:02:21 AM
// Design Name: 
// Module Name: rotateLED
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


module rotateLED(
    input [7:0] DZero,
    input reset, shift, clk,
    output [7:0] Q
    );

    wire clkout; //change this for implementation
        
    
    ClockDivider cd(.clkin(clk),.clkout(clkout));
    
    genvar i;
    //assign q = Q[7];
    generate
        for (i=0; i<=7; i=i+1)
        begin:someThing
            if (i == 0)
            Dregister stage(.dOne(Q[7]),.dZero(DZero[i]),.shift(~shift),.reset(reset),.clk(clkout),.q(Q[i]));
            else
            Dregister stage(.dOne(Q[i-1]),.dZero(DZero[i]),.shift(~shift),.reset(reset),.clk(clkout),.q(Q[i]));
        end
    endgenerate
endmodule
