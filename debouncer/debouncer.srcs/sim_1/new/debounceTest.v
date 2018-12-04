`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2018 12:02:04 PM
// Design Name: 
// Module Name: debounceTest
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


module debounceTest;

reg b,clk, bclk;
wire d;

debouncer dut(
    .b(b),
    .clk(clk),
    .d(d)
    );
    
    initial begin
    b = 0;
    clk = 0;
    bclk = 0;
    
    forever #10 clk = ~clk;
    end
    
    always @(posedge clk) begin
        bclk = ~bclk;
        if (bclk)
            b = ~b;            
    end

endmodule
