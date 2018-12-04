`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2018 09:48:00 AM
// Design Name: 
// Module Name: Dregister
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


module Dregister(
    input dOne, dZero, shift, reset, clk,
    output q
    );
    wire m0, m1;
    mux zero (.sel(shift),.y(q),.x(dOne),.o(m0));
    mux one (.sel(reset),.x(m0),.y(dZero),.o(m1));
    DFF d1 (.d(m1),.clk(clk),.q(q));
endmodule
