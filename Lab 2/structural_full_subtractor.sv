`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2020 14:11:57
// Design Name: 
// Module Name: structural_full_subtractor
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


module structural_full_subtractor( input logic a, b, Bin, output logic d, Bout);
    logic n1, n2, n3; // internal nodes
    xor( n1, a, b);
    xor( d, Bin, n1);
    and( n2,~a, b);
    and( n3, ~n1, Bin);
    or( Bout, n3, n2);
endmodule
