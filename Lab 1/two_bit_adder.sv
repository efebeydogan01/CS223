`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2020 19:50:39
// Design Name: 
// Module Name: two_bit_adder
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


module two_bit_adder( input logic a0, b0, Cin0, a1, b1, output logic Cout1, sum1, sum0);
    logic Cout0; // internal node
    behavioral_full_adder adder0( a0, b0, Cin0, sum0, Cout0);
    behavioral_full_adder adder1( a1, b1, Cout0, sum1, Cout1);
endmodule

