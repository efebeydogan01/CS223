`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2020 19:20:12
// Design Name: 
// Module Name: behaviorialfulladder_testbench
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


module behaviorialfulladder_testbench();
    logic a, b, Cin;
    logic sum, Cout;

   behavioral_full_adder dut( a, b, Cin, sum, Cout);
   
    initial begin
        a = 0; b = 0; Cin = 0; #10;
        if ( sum != 0 || Cout != 0) $display("000 failed");
        Cin = 1; #10;
        if ( sum != 1 || Cout != 0) $display("001 failed");
        b = 1; Cin = 0; #10;
        if ( sum != 1 || Cout != 0) $display("010 failed");
        Cin = 1; #10;
        if ( sum != 0 || Cout != 1) $display("011 failed");
        a = 1; b = 0; Cin = 0; #10;
        if ( sum != 1 || Cout != 0) $display("100 failed");
        Cin = 1; #10;
        if ( sum != 0 || Cout != 1) $display("101 failed");
        b = 1; Cin = 0; #10;
        if ( sum != 0 || Cout != 1) $display("110 failed");
        Cin = 1; #10;
        if ( sum != 1 || Cout != 1) $display("111 failed");
        end
    endmodule
