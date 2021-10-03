`timescale 1ns / 1ps

module memorymodule_testbench();
    logic clk, writeEnable;
    logic [3:0] writeAddress;
    logic [7:0] writeData;
    logic [3:0] readAddress1;
    logic [3:0] readAddress2;
    logic [7:0] readData1;
    logic [7:0] readData2;
    
    memory_module dut( clk, writeEnable, writeAddress, writeData, readAddress1, readAddress2, readData1, readData2);
    
    always
        begin
            clk = 1; #1;
            clk = 0; #1;
        end                                                               
        
    initial begin
        // writeEnable = 0; #5;
        writeEnable = 1;
        writeAddress = 4'b0;
        writeData = 8'b0;
        readAddress1 = 4'b0;
        readAddress2 = 4'b0;
        for ( int i = 4'b0; i < 5'b10000; i++) begin
            #10;
            writeAddress = i;
            if ( i != 4'b0) 
                writeData = writeData + 1;
                
            readAddress1 = i;
            readAddress2 = i;
            #10;
        end
    end
endmodule
