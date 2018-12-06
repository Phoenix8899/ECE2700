`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2018 01:28:30 AM
// Design Name: 
// Module Name: processor
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


module processor(
    input sel, clk,en,
    input [7:0] sw,
    output reg [3:0] led
    );
       wire den;
       wire clockout;
       wire [3:0] regLed,  regRom;
        //debouncer S(.b(sel),.clk(clk),.d(dsel));
        clockDivider C(.clkin(clk),.clkout(clkout)); 
        debouncer E(.b(en),.clk(clk),.d(den));
        caseController single(.sw(sw),.en(den),.clk(clk),.led(regLed));
        rom R(.en(en),.clk(clkout),.led(regRom));
        
        always @(posedge clk) begin
            case (sel) 
                1'b0 :  begin
                    //if (den) begin
                        led = regLed;
                    //end 
                end 
                1'b1 : begin
                    led = regRom;                  
                end 
                    
                default begin
                    led <= 4'b0000;
                end
            endcase
        end
endmodule
