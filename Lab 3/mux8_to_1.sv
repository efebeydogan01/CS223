`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2020 17:59:43
// Design Name: 
// Module Name: mux8_to_1
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


module mux8_to_1( input logic [7:0]d, [2:0]s, output logic y);
    logic output1, output2;
    logic n1, n2;
    
    mux4_to_1 mux1( d[3:0], s[1:0], output1);
    mux4_to_1 mux2( d[7:4], s[1:0], output2);
    
    and( n1, output1, ~s[2]);
    and( n2, output2, s[2]);
    
    or( y, n1, n2);
    
endmodule
