`timescale 1ns / 1ps

module clock_fsm(input logic clk, reset, Sa, Sb, output logic [2:0] La, Lb);
    logic clock;
    
    clock_counter clockdiv(clk, reset, clock);
    
    traffic_light_system fsm(clock, reset, Sa, Sb, La, Lb);
    
endmodule
