`timescale 1ns / 1ps

module traffic_light_system( input logic clk, input logic reset, input logic Sa, Sb, output logic [2:0] La, Lb);
    typedef enum logic [2:0] {S0, S1, S2, S3, S4, S5, S6, S7} statetype;
    statetype state, nextstate;
    
    // state register
    always_ff @(posedge clk, posedge reset)
    if (reset) state <= S0;
    else state <= nextstate;
    
    // next state logic
    always_comb
        case (state)
            S0: if (Sa) nextstate = S0;
                else nextstate = S1;
            S1: nextstate = S2;
            S2: nextstate = S3;
            S3: nextstate = S4;
            S4: if (Sb) nextstate = S4;
                else nextstate = S5;
            S5: nextstate = S6;
            S6: nextstate = S7;
            S7: nextstate = S0;
            default: nextstate = S0;
    endcase
    
    // output logic
    logic n0, n1;
    
    xor( n0, state[1], state[2]);
    
    assign La[2] = n0 | (state[1] & ~state[0]);
    assign La[1] = n0 | ~state[0];
    assign La[0] = 1;
    
    assign Lb[2] = ~n0 | (~state[2] & ~state[0]);
    assign Lb[1] = ~n0 | ~state[0];
    assign Lb[0] = 1;
endmodule
