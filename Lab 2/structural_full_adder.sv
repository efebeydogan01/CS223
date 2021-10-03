`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2020 13:51:22
// Design Name: 
// Module Name: structural_full_adder
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


module structural_full_adder(input logic a, b, Cin, output logic sum, Cout);
    logic n1, n2, n3; // internal nodes
    xor( n1, a, b);
    xor( sum, n1, Cin);
    and( n2, n1, Cin);
    and( n3, a, b);
    or( Cout, n2, n3);   
endmodule
