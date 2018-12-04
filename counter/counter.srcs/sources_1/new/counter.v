`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2018 07:53:28 AM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,incr,rst,
    output [7:0] Q
    );

    wire [7:0] J;
    wire [7:0]K;
    wire tempClk;
    wire cdOut;
    
    ClockDivider cd(.clkin(clk),.clkout(cdOut));
 
    genvar i;
        generate
            for (i=0; i<=7; i=i+1)
            begin:someThing
                if (i == 0)
                begin
                    assign J[i] = incr&~rst;
                    assign K[i] = J[i]|rst;
                    assign tempClk = cdOut & (incr | rst);
                    JKFF stage(.J(J[i]),.K(K[i]),.clk(tempClk),.Q(Q[i]));
                end
                else 
                begin
                    assign J[i] = J[i-1] & Q[i-1] & ~rst;
                    assign K[i] = J[i]|rst;
                    assign tempClk = cdOut & (incr | rst);
                    JKFF stage(.J(J[i]),.K(K[i]),.clk(tempClk),.Q(Q[i]));                
                end
            end
        endgenerate
endmodule
