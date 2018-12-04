`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2018 10:55:09 AM
// Design Name: 
// Module Name: processorTest
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


module processorTest;

reg [7:0] sw;
reg clk, en, sel;
wire [3:0] led;

processor DUT (
    .sw(sw),
    .en(en),
    .sel(sel),
    .clk(clk),
    .led(led)
    );

initial begin
sel = 0;
sw = 0;
clk = 0;
en = 0;

//    #100;
//    #10 sw = 8'b0000_0001; //load x
//    #20 sw = 8'b0100_0000;//store x
//    #20 sw = 8'b0010_0101;
//    #20 sw = 8'b0011_1111;
//    #20 sw = 8'b0110_0000;
//    #20 sw = 8'b0111_0000;
forever #10 clk = ~clk;
   
end

always @(posedge clk) begin
    sw = sw + 1;
    en = ~en;
    end
    

endmodule
