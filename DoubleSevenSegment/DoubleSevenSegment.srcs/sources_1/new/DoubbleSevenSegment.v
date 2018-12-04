`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2018 05:20:55 AM
// Design Name: 
// Module Name: DoubbleSevenSegment
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


module DoubbleSevenSegment(
    input clk,
    input [7:0] sw,
    output [3:0] an,
    output [6:0] ld
    );
    wire [3:0] d;
    wire sel;
    wire [6:0]temp;
    //clk -> clock divider -> sel 
    //sel -> MUXarray 
    //MUXarray -> d[3:0]
    //d -> 4_16decoder 
    //decoder -> display
    //sel -> an 0 | ~an 1
    
    ClockDivider cd(
                    .clkin(clk),
                    .clkout(sel)
                    );
                    
    MUXarray ma(
                .sel(sel),
                .a(sw[3:0]),
                .b(sw[7:4]),
                .o(d)
                );
                                    
    
    sevensegment display(
                       .wxyz(d),
                       .seg(temp)
                       );
                       
   assign an[0] = ~sel;
   assign an[1] = sel;      
   assign an[2] = 1;
   assign an[3] = 1;
   assign ld = ~temp; 
    
    
    
endmodule
