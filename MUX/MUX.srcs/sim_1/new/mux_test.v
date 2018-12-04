`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2018 09:38:58 AM
// Design Name: 
// Module Name: mux_test
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


module mux_test(
    );
    reg clk;
    reg [1:0] i;
    reg sel;
    wire o;
    
    mux DUT(
    .i(i),
    .sel(sel),
    .o(o)
    );
    
    initial begin 
        i[1] = 1;
        i[0] = 0;
        sel = 0;
        clk = 0;
  
        #100;
        forever #10 clk = ~clk;
    end  
    
    always @(posedge clk) begin
        sel = ~sel;
    end
endmodule
