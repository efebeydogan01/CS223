`timescale 1ns / 1ps

module testbench_traffic();
    logic clk, reset, Sa, Sb;
    logic [2:0] La, Lb;

    // instantiate device under test
    traffic_light_system dut(clk, reset, Sa, Sb, La, Lb);

    // apply inputs one at a time
    always
        begin
            clk = 1; #10; 
            clk = 0; #10;
        end
        
    initial begin
        reset = 1; Sa = 0; Sb = 0; #10;
        Sa = 1; #10;
        reset = 0; #100;
        Sb = 1; #100;
        Sa = 0; #100;
        Sa = 0; Sb = 0; #100;
    end
     
endmodule
                 