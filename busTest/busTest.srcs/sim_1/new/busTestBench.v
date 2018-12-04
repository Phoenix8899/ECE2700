`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2018 10:34:27 AM
// Design Name: 
// Module Name: busTestBench
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


module busTestBench;

reg clk;
reg [3:0] sw; //count
wire [3:0] led;

busTest DUT (
    .sw(sw),
    .clk(clk),
    .led(led)
    );

initial begin
clk = 0;
sw = 0;

forever #10 clk = ~clk;

end

always @(posedge clk) begin
    sw = sw + 1;
end

endmodule
