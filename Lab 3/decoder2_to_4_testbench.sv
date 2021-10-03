`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2020 17:18:44
// Design Name: 
// Module Name: decoder2_to_4_testbench
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


module decoder2_to_4_testbench();
    logic a[1:0];
    logic y[3:0];
    
    decoder2_to_4 dut( a[1:0], y[3:0]);
    
    initial begin
        a[0] = 0; a[1] = 0; #10;
        if (y[0] != 1 | y[1] != 0 | y[2] != 0 | y[3] != 0) $display("00 failed.");
        a[0] = 1; #10;
        if (y[0] != 0 | y[1] != 1 | y[2] != 0 | y[3] != 0) $display("10 failed.");
        a[0] = 0; a[1] = 1; #10;
        if (y[0] != 0 | y[1] != 0 | y[2] != 1 | y[3] != 0) $display("01 failed.");
        a[0] = 1; #10;
        if (y[0] != 0 | y[1] != 0 | y[2] != 0 | y[3] != 1) $display("11 failed.");
        end
endmodule
