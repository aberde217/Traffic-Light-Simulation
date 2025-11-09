`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2025 11:11:52 AM
// Design Name: 
// Module Name: tb_green_counter
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


module tb_green_counter();
reg clock, enable;
wire out;
wire [3:0] count;
GreenCounter ip(.clock(clock), .enable(enable), .out(out), .count(count));
initial begin
    clock = 0;
    forever #15 clock = ~clock;
end
initial begin 
    enable = 1;
    #30
    enable = 1;
    #30
    enable = 0;
    #30 
    enable = 1;
    #30
    enable = 1;
    #30
    enable = 1;
    #30
    enable = 1;
    #30
    enable = 1;
    #30
    enable = 1;
    #30
    enable = 1;
    #30
    enable = 1;
    #30
    enable = 1;
    #30
    enable = 1;
    #30
    enable = 1;
    #30
    enable = 1;
    #30
    enable = 0;
    #30
    enable = 1;
    #30
    $finish;
end 
endmodule
