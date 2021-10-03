`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2020 19:18:39
// Design Name: 
// Module Name: behavioral_full_adder
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


module behavioral_full_adder( input logic a, b, Cin, output logic sum, Cout);
    assign sum = (a ^ b) ^ Cin;
    assign Cout = ( ( a ^ b) & Cin) | ( a & b);
endmodule
