`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2018 04:30:01 AM
// Design Name: 
// Module Name: decoder4_16
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


module decoder4_16(
    input [3:0] d,
    output [15:0] o
    );
    wire en1, en2;
    assign en1 = d[3];
    assign en2 = ~d[3];
    
    
    decoder3_8 d1 (
                    .en(en1),    
                    .d(d[2:0]),
                    .o(o[7:0])
                   );
                   
    decoder3_8 d2 (
                    .en(en2),
                    .d(d[2:0]),
                    .o(o[15:8])
                   );
                   
endmodule   
