`timescale 1ns / 1ps

module processor( input logic clk, reset, nextInstruction,
                  input logic [2:0] opcode,
                  input logic immBit, 
                  input logic [15:0] instruction,
                  input logic [7:0] memReadData,
                  output logic [7:0] memWriteData,
                  output logic [3:0] memAddress,
                  output logic [4:0] insAddress,
                  output logic [3:0] memWriteAddress,
                  output logic stopEnable,
                  output logic writeEnableMem);
                  
    logic equals, writeEnableReg, loadPC, writeFromMem, jumpEnable, addrDst, dataDst, aluopcode;
    controller controls( opcode, immBit, equals, nextInstruction,
                         writeEnableReg, writeEnableMem, loadPC, writeFromMem,
                         aluopcode, jumpEnable,
                         addrDst, dataDst, 
                         stopEnable);
    
    datapath path( clk, reset, 
                   instruction,
                   memReadData,
                   writeEnableReg, writeEnableMem, aluopcode, jumpEnable, stopEnable, loadPC, writeFromMem,
                   addrDst, dataDst,
                   equals,
                   memAddress,
                   memWriteData,
                   insAddress,
                   memWriteAddress);
endmodule
