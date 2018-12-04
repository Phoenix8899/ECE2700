`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2018 06:28:07 AM
// Design Name: 
// Module Name: doubbleSevenSegment_test
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


module doubbleSevenSegment_test();

reg clk;
reg [7:0]count;
reg [7:0] sw; 
wire [1:0] an; 
wire [6:0] ld;

DoubbleSevenSegment DUT(
    .clk(clk),
    .sw(sw),
    .an(an),
    .ld(ld)
    );

initial begin
    count = 0; 
    sw = 0;
    clk = 0;
    
    #100
    
    forever #10 clk=~clk;
end


always @(posedge clk) begin
    
    if (sw >= 9)
        sw <= 0;
    else 
        sw <= sw + 1;
end
endmodule
