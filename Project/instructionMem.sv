`timescale 1ns / 1ps

module instructionMem( input [4:0] address, output logic [15:0] instruction);
    // logic [15:0] memory[31:0];
    
//    assign memory[0] = 16'b000_1_0000_00000010; // d[0]=2
//    assign memory[1] = 16'b000_1_0001_00000111; // d[1]=7
//    assign memory[2] = 16'b001_0_0000_0000_0000; // r[0]=d[0]=2
//    assign memory[3] = 16'b101_0_0110_0110_0101; // to 6 if rf[5]=rf[6]=0
//    assign memory[4] = 16'b001_1_0001_00000011; // r[1]=3
//    assign memory[5] = 16'b001_1_0010_00000100; // r[2]=4
//    assign memory[6] = 16'b010_0_1000_0000_0001; // r[8]=r[0]+r[1]=5
//    assign memory[7] = 16'b000_1_0000_00001010; // d[0]=10
//    assign memory[8] = 16'b111_1_0000_00001010;
//    assign instruction = memory[address];
    
//    5'b00000: instruction = 16'b000_1_0000_00000010; // d[0]=2
//    5'b00001: instruction = 16'b000_1_0001_00000111; // d[1]=7
//    5'b00010: instruction = 16'b001_0_0000_0000_0000; // r[0]=d[0]=2
//    5'b00011: instruction = 16'b101_0_0110_0110_0101; // to 6 if rf[5]=rf[6]=0
//            5'b00100: instruction = 16'b001_1_0001_00000011; // r[1]=3
//            5'b00101: instruction = 16'b001_1_0010_00000100; // r[2]=4
//            5'b00110: instruction = 16'b010_0_1000_0000_0001; // r[8]=r[0]+r[1]=5
//            5'b00111: instruction = 16'b000_1_0000_00001010; // d[0]=10   
    
    
    
    always_comb
        case ( address)
//            5'b00000: instruction = 16'b000_0_0000_0000_0000; // rf[0] = d[0]
//            5'b00001: instruction = 16'b000_0_0000_0001_0001; // rf[1] to d[1]
//            5'b00010: instruction = 16'b000_0_0000_0000_0100; // rf[4] to d[0]
//            5'b00011: instruction = 16'b000_0_0000_0001_0101; // rf[5] to d[1]
            5'b00000: instruction = 16'b001_0_0000_0000_0000; // load from dm[0] to rf[0]
            5'b00001: instruction = 16'b001_0_0000_0001_0001; // load from dm[1] to rf[1]
            5'b00010: instruction = 16'b001_1_0010_00000000; // load 0 to rf[2]
            5'b00011: instruction = 16'b001_1_1111_00000000; // load 0 to rf[15]
            5'b00100: instruction = 16'b001_1_0100_00000001; // load 1 to rf[4]
            5'b00101: instruction = 16'b101_01001_0010_0001; // branch to IM[9] if rf[2] == rf[1]
            5'b00110: instruction = 16'b010_0_1111_1111_0000; // Add RF[15] += RF[0]
            5'b00111: instruction = 16'b010_0_0010_0010_0100; // Add RF[2] += RF[4]
            5'b01000: instruction = 16'b101_00101_0000_0000; // Branch to IM[5] if RF[0] == RF[0]
            5'b01001: instruction = 16'b000_0_1111_1111_1111; // Store RF[15] to DM[15] 
            
            default: instruction = 16'b111_0_0000_0000_0000;            
        endcase
endmodule
