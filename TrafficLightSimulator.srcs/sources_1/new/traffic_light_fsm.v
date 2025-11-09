`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2025 09:43:25 PM
// Design Name: 
// Module Name: TrafficLightFSM
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
//    output Wa,  //Walk Sign at crosswalk parallel to traffic when Light A is green
//    output Wb   //Walk Sign at crosswalk parallel to traffic when Light B is green

module TrafficLightFSM(
    input Ta,                //Traffic Sensor A
    input Tb,                //Traffic Sensor B
    input clock,
    output reg [1:0] La,         //Light A
    output reg [1:0] Lb         //Light B
    );
reg [3:0] current_state;
wire [3:0] tempA, tempB;
reg enableA, enableB;
wire time_upA, time_upB;
initial begin 
    current_state = 4'b0001;
    enableA = 1'b1;
    enableB = 1'b0;
    La = 2'b10;
    Lb = 2'b00;
end 
GreenCounter greenCountA(.clock(clock), .enable(enableA), .out(time_upA), .count(tempA)); 
GreenCounter greenCountB(.clock(clock), .enable(enableB), .out(time_upB), .count(tempB));
always @(posedge clock) begin 
    case(current_state)
        4'b0001: begin 
            if (Ta && ~time_upA) begin 
                current_state <= 4'b0001;
                La <= 2'b10;
                Lb <= 2'b00;
                enableA <= 1'b1;
            end 
            else begin 
                current_state <= 4'b0010;
                La <= 2'b01;
                Lb <= 2'b00;
                enableA <= 1'b0;
            end 
        end 
        4'b0010: begin 
            current_state <= 4'b0100;
            La <= 2'b00;
            Lb <= 2'b10;
            enableB <= 1'b1;
        end
        4'b0100: begin 
            if (Tb && ~time_upB) begin 
                current_state <= 4'b0100;
                La <= 2'b00;
                Lb = 2'b10;
                enableB <= 1'b1;
            end 
            else begin 
                current_state <= 4'b1000;
                La <= 2'b00;
                Lb <= 2'b01;
                enableB <= 1'b0;
            end 
        end
        4'b1000: begin 
            current_state <= 4'b0001;
            La <= 2'b10;
            Lb <= 2'b00;
            enableA <= 1'b1;
        end
    endcase 
end 
endmodule 

module GreenCounter( 
    input clock,
    input enable,
    output reg out,
    output reg [3:0] count
    );
initial begin 
    count = 4'b0000;
    out = 1'b0;
end 
always @(posedge clock) begin 
    if (!enable) begin 
        count = 4'b0000;
        out = 1'b0;
    end 
    else begin 
        count[3] <= (count[3] & ~count[0]) | (count[2] & count[1] & count[0]);
        count[2] <= (count[2] & ~count[1]) | (count[2] & ~count[0]) | (~count[2] & count[1] & count[0]);
        count[1] <= (~count[3] & ~count[1] & count[0]) | (count[1] & ~count[0]);
        count[0] <= ~count[0];
        out <= count[3] & ~count[1] & ~count[0];
    end 
end 
endmodule 
