`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2018 08:01:12 AM
// Design Name: 
// Module Name: decoder_test
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


module decoder_test(  
    );
    reg clk; 
    reg [3:0] count;
    reg [2:0] d;
    reg en;
    wire [7:0] o; 
    
    decoder3_8 DUT (
    .d(d),
    .en(en),
    .o(o)
    );
    
    initial begin 
        d = 0;
        en = 0;
        count = 0;
        clk = 0;
    
        #100;
    
        forever #10 clk=~clk;
    end
    
    always @(posedge clk) begin
        count <= count + 1;
        d <= count [2:0];
        en <= count[3];
    end
    
endmodule
