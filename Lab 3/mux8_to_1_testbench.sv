`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2020 19:19:25
// Design Name: 
// Module Name: mux8_to_1_testbench
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


module mux8_to_1_testbench();
    logic [7:0]d; 
    logic [2:0]s;
    logic y;
   
    mux8_to_1 dut( d[7:0], s[2:0], y);
    initial begin
        for ( int i = 0; i < 2048; i++) begin
            {d[7:0], s[2:0]} = i; #0.1;
            if ( y != d[s]) $display("%0d failed", {d,s});
         end
     end
        
endmodule
