`timescale 1ns / 1ps

module datapath( logic clk, reset, 
                 input logic [15:0] instruction,
                 input logic [7:0] memReadData,
                 input logic writeEnableReg, writeEnableMem, aluopcode, jumpEnable, stopEnable, loadPC, writeFromMem,
                 input logic addrDst, dataDst,
                 output logic equals,
                 output logic [3:0] memAddress,
                 output logic [7:0] memWriteData,
                 output logic [4:0] insAddress,
                 output logic [3:0] memWriteAddress);
                 
    logic [4:0] nextAddress;
    logic [3:0] regAddr;
    logic [7:0] regWriteData, regRead1, regRead2;  
    logic [7:0] sum; 
    
    // next instruction       
    always_ff @( posedge clk, posedge reset)
        if (reset)
            insAddress <= 5'b0;                   
        else if ( ( loadPC && ~stopEnable) || jumpEnable) insAddress <= nextAddress;                   
                     
    assign nextAddress = jumpEnable ? instruction[12:8] : (insAddress + 1);
    
    // register file
    registerFile register( clk, reset, writeEnableReg, regAddr, regWriteData, instruction[7:4], instruction[3:0], regRead1, regRead2);
    
    assign regAddr = addrDst ? instruction[11:8] : instruction[7:4];    
    assign regWriteData = dataDst ? instruction[7:0] : ( writeFromMem ? memReadData : sum);
    
    // ALU
    alu ALU( aluopcode, regRead1, regRead2, sum, equals);                     
    
    // memory
    assign memAddress = instruction[3:0];
    assign memWriteData = dataDst ? instruction[7:0] : regRead2;
    
    assign memWriteAddress = addrDst ?  instruction[11:8] : instruction[7:4];
                  
endmodule
