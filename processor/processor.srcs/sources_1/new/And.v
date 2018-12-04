`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2018 05:46:47 AM
// Design Name: 
// Module Name: And
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


module And(
    input [7:0] sw,
output reg [3:0] W,X,Y,Z
);

always @(*) begin
case (sw[5:2])
    4'b0000 : begin
        W <= W & W;
    end
    4'b0001 : begin
        W <= W & X;
    end
    4'b0010 : begin
        W <= W & Y;
    end
    4'b0011 : begin
        W <= W & Z;
    end
    4'b0100 : begin
        X <= X & W;
    end
    4'b0101 : begin
        X <= X & X;
    end
    4'b0110 : begin
        X <= X & Y;
    end
    4'b0111 : begin
        X <= X & Z;
    end
    4'b1000 : begin
        Y <= Y & W;
    end
    4'b1001 : begin
        Y <= Y & X;
    end
    4'b1010 : begin
        Y <= Y & Y;
    end
    4'b1011 : begin
        Y <= Y & Z;
    end
    4'b1100 : begin
        Z <= Z & W;
    end
    4'b1101 : begin
        Z <= Z & X;
    end
    4'b1110 : begin
        Z <= Z & Y;
    end
    4'b1111 : begin
        Z <= Z & Z;
    end
endcase    
end

endmodule
