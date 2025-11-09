`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2025 12:48:14 PM
// Design Name: 
// Module Name: tb_traffic_light_fsm
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


module tb_traffic_light_fsm();
reg Ta, Tb, clock;
wire [1:0] La, Lb;
TrafficLightFSM ip(.Ta(Ta), .Tb(Tb), .clock(clock), .La(La), .Lb(Lb));
initial begin
    clock = 0;
    forever #2.5 clock = ~clock;
end 
initial begin 
    Ta = 1'b1; Tb = 1'b0;
    #50
    Ta = 1'b1; Tb = 1'b1;
    #50
    Ta = 1'b1; Tb = 1'b0;
    #25
    Ta = 1'b0; Tb = 1'b0;
    #25
    Ta = 1'b1; Tb = 1'b1;
    #25
    Ta = 1'b1; Tb = 1'b0;
    #25
    $finish;
end 
endmodule
