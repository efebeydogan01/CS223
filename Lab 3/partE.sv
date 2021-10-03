`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2020 19:59:56
// Design Name: 
// Module Name: partE
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


module partE( input logic a, b, c, d, output logic y);
    mux8_to_1 mux1( {d, 1'b0, 1'b1, ~d, d, ~d, d, 1'b1}, {a, b, c}, y);
endmodule
