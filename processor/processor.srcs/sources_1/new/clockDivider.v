`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2018 06:33:13 PM
// Design Name: 
// Module Name: clockDivider
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


module clockDivider(
    input clkin, 
output reg clkout
);

reg [24:0] count;

initial begin
    count = 0;
    clkout = 0;
end

always @(posedge clkin) begin
    if (count ==  25'd50_000_000) begin
        count <= 0;
        clkout <= ~clkout;
    end
    else begin
        count <= count + 1;
    end
end

endmodule
