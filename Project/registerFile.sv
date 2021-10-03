`timescale 1ns / 1ps

module registerFile( input logic clk, reset, writeEnable, input logic [3:0] writeAddress, input logic [7:0] writeData,
                     input logic [3:0] readAddress1, readAddress2,
                     output logic [7:0] readData1, readData2);
    logic [7:0] registers [15:0];
    
    initial begin
        for ( int i = 0; i < 16; i++) begin
            registers[i] = 8'b0;
        end
    end
    
    always_ff @(posedge clk, posedge reset)
        if ( reset) begin
            for ( int i = 0; i < 16; i++) begin
                registers[i] = 8'b0;
            end
        end
        else if ( writeEnable) begin
            registers[writeAddress] <= writeData;
        end 
    
    assign readData1 = registers[readAddress1];
    assign readData2 = registers[readAddress2];                           
endmodule
