`timescale 1ns / 1ps

module controller( input logic [2:0] opcode, input logic immBit, equals, nextInstruction,
                   output logic writeEnableReg, writeEnableMem, loadPC, writeFromMem,
                   output logic aluopcode, jumpEnable, 
                   output logic addrDst, dataDst,
                   output logic stopEnable);
                   
    always_comb
        case ( opcode)
            3'b000: begin
                writeEnableMem = 1;
                writeEnableReg = 0;
                aluopcode = 0;
                jumpEnable = 0;
                stopEnable = 0;
                writeFromMem = 0;
                if ( immBit) begin 
                    addrDst = 1;
                    dataDst = 1;
                end 
                else begin
                    addrDst = 0;
                    dataDst = 0;
                end
            end
            3'b001: begin
                writeEnableMem = 0;
                writeEnableReg = 1;
                aluopcode = 0;
                jumpEnable = 0;
                stopEnable = 0;
                if ( immBit) begin
                    addrDst = 1;
                    dataDst = 1;
                    writeFromMem = 0;
                end
                else begin
                    addrDst = 0;
                    dataDst = 0;
                    writeFromMem = 1;
                end
            end
            3'b010: begin
                writeEnableReg = 1;
                aluopcode = 0;
                writeEnableMem = 0;
                jumpEnable = 0;
                addrDst = 1;
                dataDst = 0; 
                stopEnable = 0;
                writeFromMem = 0;               
            end
            3'b101: begin
                writeEnableReg = 0;
                aluopcode = 1;
                writeEnableMem = 0;
                writeFromMem = 0;
                if ( equals)
                    jumpEnable = 1;
                else
                    jumpEnable = 0;

                addrDst = 0;
                dataDst = 0;
                stopEnable = 0;
            end
            3'b111: begin
                writeEnableReg = 0;
                aluopcode = 0;
                writeEnableMem = 0;
                jumpEnable = 0;
                addrDst = 0;
                dataDst = 0; 
                stopEnable = 1;  
                writeFromMem = 0;             
            end
            default: begin
                writeEnableReg = 0;
                aluopcode = 0;
                writeEnableMem = 0;
                jumpEnable = 0;
                addrDst = 0;
                dataDst = 0; 
                stopEnable = 0;  
                writeFromMem = 0;      
            end
        endcase
   
    assign loadPC = nextInstruction;        
endmodule
