`timescale 1ns / 1ps

module memory_module(input logic clk, writeEnable, input logic [3:0] writeAddress, input logic [7:0] writeData, 
    input logic [3:0] readAddress1, input logic [3:0] readAddress2, output logic [7:0] readData1, output logic [7:0] readData2);
    
    logic [7:0] RAM[15:0]; // 16x8 memory module  
    
    always_ff @(posedge clk)
    begin
        if ( writeEnable)
            RAM[writeAddress] <= writeData;
        end
    
    assign readData1 = RAM[readAddress1];
    assign readData2 = RAM[readAddress2];
    
endmodule