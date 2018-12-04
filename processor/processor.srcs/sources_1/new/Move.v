`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2018 05:46:47 AM
// Design Name: 
// Module Name: Move
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


module Move(
    input [7:0] sw,
    output reg [3:0] W,X,Y,Z
    );
    
    always @(*) begin
    case (sw[5:2])
        4'b0000 : begin
            W <= W;
        end
        4'b0001 : begin
            W <= X;
        end
        4'b0010 : begin
            W <= Y;
        end
        4'b0011 : begin
            W <= Z;
        end
        4'b0100 : begin
            X <= W;
        end
        4'b0101 : begin
            X <= X;
        end
        4'b0110 : begin
            X <= Y;
        end
        4'b0111 : begin
            X <= Z;
        end
        4'b1000 : begin
            Y <= W;
        end
        4'b1001 : begin
            Y <= X;
        end
        4'b1010 : begin
            Y <= Y;
        end
        4'b1011 : begin
            Y <= Z;
        end
        4'b1100 : begin
            Z <= W;
        end
        4'b1101 : begin
            Z <= X;
        end
        4'b1110 : begin
            Z <= Y;
        end
        4'b1111 : begin
            Z <= Z;
        end
    endcase    
    end
endmodule
