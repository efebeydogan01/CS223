`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2020 17:11:41
// Design Name: 
// Module Name: decoder2_to_4
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


module decoder2_to_4( input logic a[1:0], output logic y[3:0]);
    assign y[3] = a[0] & a[1];
    assign y[2] = ~a[0] & a[1];
    assign y[1] = a[0] & ~a[1];
    assign y[0] = ~a[0] & ~a[1];
endmodule
