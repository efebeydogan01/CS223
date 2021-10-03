`timescale 1ns / 1ps

module alu( input logic aluOP, input logic [7:0] number1, number2, output logic [7:0] sum, output logic equals);
    always_comb
        case ( aluOP)
            1'b1: begin if ( number1 == number2) equals = 1; sum = 8'b0; end
            1'b0: begin equals = 0; sum = number1 + number2; end
            default: begin equals = 0; sum = 8'b0; end
        endcase
endmodule
