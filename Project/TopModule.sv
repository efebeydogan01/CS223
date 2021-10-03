`timescale 1ns / 1ps

module TopModule( input logic clk, input logic [4:0] buttons, input logic [15:0] switchInstruction, output logic [15:0] memInst,
                  output logic [6:0] seg, output logic dp, output logic [3:0] an);
                  
    logic prevMem, nextMem, reset, executeSwitch, executeMem;
    logic [4:0] insAddress;
    logic [3:0] addressCounter, memAddress;
    logic [15:0] instruction;
    logic writeEnable;
    logic [7:0] memReadData, memWriteData, sevSegData;
    logic [3:0] memWriteAddress;
    logic stopEnable;
    
    debouncer prev( clk, buttons[4], prevMem);
    debouncer next( clk, buttons[3], nextMem);
    debouncer res( clk, buttons[2], reset);
    debouncer switch( clk, buttons[1], executeSwitch);
    debouncer mem( clk, buttons[0], executeMem);
    
    
    always_ff @( posedge clk, posedge reset)
    begin
        if (reset) begin
            instruction <= 16'b110_0000000000000;
            addressCounter <= 0;
        end
        else if ( nextMem) begin
            addressCounter <= addressCounter + 1;
        end
        else if ( prevMem) begin
            addressCounter <= addressCounter - 1;
        end
        else if ( !stopEnable) begin
            if ( executeSwitch) begin
                instruction <= switchInstruction;
            end
            else if ( executeMem) begin
                instruction <= memInst;
            end
            else begin
                instruction <= 16'b110_0000000000000;
            end
        end
    end
    
    instructionMem instMem( insAddress, memInst);
    processor process( clk, reset, executeMem, instruction[15:13], instruction[12], instruction, memReadData, memWriteData, memAddress,
                         insAddress, memWriteAddress, stopEnable, writeEnable);
    dataMem datamemory( clk, reset, writeEnable, memWriteData, memWriteAddress, memAddress, 
                        addressCounter, memReadData, sevSegData);
    sevSegDisplay display( clk, addressCounter, 0, sevSegData[7:4], sevSegData[3:0], seg, dp, an);                  
endmodule
