`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2018 11:44:28 AM
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    input b, clk,
    output reg d
    );
    reg [1:0]state; 
    
    always @(posedge clk) begin
        case (state)
            2'b00: begin
                state <= (b)? 2'b00 : 2'b01;
                d <= 0;
            end
            2'b01: begin
                state <= (b)? 2'b10 : 2'b11;
                d <= 0;
            end
            2'b11: begin
                state <= (b)? 2'b10 : 2'b11;
                d <= 0;
            end
            2'b10: begin
                state <= (b)? 2'b00 : 2'b01;
                d <= 1;
            end
            default begin
                state <= 2'b00;
                d <= 0;
            end
        endcase
    end
endmodule


//(s)? x:y //simple inline mux