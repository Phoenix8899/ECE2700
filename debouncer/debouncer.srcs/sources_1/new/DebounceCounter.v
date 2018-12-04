`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2018 07:26:29 AM
// Design Name: 
// Module Name: DebounceCounter
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


module DebounceCounter(
    input clk, btnZero, btnOne,
    output [7:0] ld
    );
    
    wire dZero, dOne;
    debouncer dZ (.clk(clk),.b(btnZero),.d(dZero));
    debouncer dO (.clk(clk),.b(btnOne),.d(dOne));
    
    jkCounter chocula (.clk(clk),.incr(dZero),.rst(dOne),.q(ld));
endmodule
