`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2018 09:35:01 AM
// Design Name: 
// Module Name: rom
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


module rom(
    input en, clk,
    output [3:0] led
    );
    
    reg [7:0] mem [0:13];
    reg [13:0] pointer;
    reg run;
    
    
    initial begin
    mem[0] <= 8'b0000_0001;
    mem[1] <= 8'b0001_0010;
    mem[2] <= 8'b0010_1000;
    mem[3] <= 8'b0011_1000;
    mem[4] <= 8'b0100_0000;
    mem[5] <= 8'b0101_0000;
    mem[6] <= 8'b0110_0000;
    mem[7] <= 8'b0111_0000;
    
    mem[8] <= 8'b0100_0000;
    mem[9] <= 8'b0101_0000;
    mem[10] <= 8'b0111_0000;
    
    mem[11] <= 8'b0100_0000;
    mem[12] <= 8'b0101_0000;
    mem[13] <= 8'b0111_0000;
    
    end
    
    wire clkout;
    
    clockDivider C(.clkin(clk),.clkout(clkout));
    
    caseController R(.sw(mem[pointer]),.en(run),.led(led));
    
    always @(posedge clkout) begin
        if (en) begin
            pointer = 0;
            run = 1;
        end
        else if (pointer == 14) begin 
            run = 0;
            pointer = 0;
        end
        else begin
            pointer = pointer + 1;
        end
    end
    
endmodule
