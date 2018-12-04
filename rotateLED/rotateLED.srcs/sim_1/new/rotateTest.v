`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2018 06:40:08 AM
// Design Name: 
// Module Name: rotateTest
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


module rotateTest;
    reg [7:0] DZero;
    reg reset, shift, clk;
    wire q;
    
    reg oclk;
    reg count;
    integer i;
    
    rotateLED Dut(
        .DZero(DZero),
        .reset(reset),
        .shift(shift),
        .clk(clk),
        .q(q)
    );
    
    initial begin
        DZero = 0;
        reset = 0;
        shift = 0;
        clk = 0;
    
        forever clk = ~clk; 
    end 
    
    always @(posedge clk) begin
        count = count + 1;
        if (count == 0)
        begin 
        DZero[0] = 1;
        reset = 1;
        shift = 0;
        end
        else if (count == 7)
        begin
            count  = 0;
            shift = 0;
        end
        else 
            shift = 1;
        
    end
    
endmodule
