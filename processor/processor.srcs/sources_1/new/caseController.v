`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2018 12:53:20 PM
// Design Name: 
// Module Name: caseController
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


module caseController(
    input [7:0] sw,
    input en,
    output reg [3:0]led
    );
    
    
    reg [3:0] array [0:4];
    
    always @(posedge en) begin
    casez(sw[7:6])
        8'b00 : begin //Load
            array[sw[5:4]] <= sw[3:0];
        end
        8'b01 : begin //Store
            array[4] = array[sw[5:4]];
        end    
        8'b10 : begin //Move
            array[sw[5:4]] <= array[sw[3:2]];
        end
        8'b11 : begin 
            case (sw[1:0])
                2'b00 : begin //add
                array[sw[5:4]] <= array[sw[5:4]] + array[sw[3:2]];
                end
                2'b01 : begin //sub
                array[sw[5:4]] <= array[sw[5:4]] - array[sw[3:2]];
                end
                2'b10 : begin //and
                array[sw[5:4]] <= array[sw[5:4]] & array[sw[3:2]];
                end
                2'b11 : begin //not
                array[sw[5:4]] <= !array[sw[5:4]];
                end
                default begin
                array[4] <= 4'b0000;
                end
            endcase
        end
        default begin
            array[4] <= 4'b0000;
        end
    endcase
       
    led = array[4];
    
    end  
    
endmodule
