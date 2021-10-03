`timescale 1ns / 1ps

module testbench();
    logic clk;
    logic [4:0] buttons;
    logic [15:0] inputInstruction, instrInMem;
    logic [6:0] seg;
    logic dp;
    logic [3:0] an;
    
    TopModule dut( clk, buttons, inputInstruction, instrInMem, seg, dp, an);
    
    // generate clock to sequence tests
    always begin
        clk <= 1; #0.01; clk <= 0; #0.01;
    end
    
    initial begin
        buttons = 5'b0; inputInstruction = 16'b0;
        
        #5; buttons[2] = 1'b1; #0.1; buttons[2] = 1'b0; #20; // reset
        
        inputInstruction = 16'b000_1_0000_00000100; #0.1;
        buttons[1] = 1; #0.1; buttons[1] = 0; #20;
        inputInstruction = 16'b000_1_0001_00000101; #0.1;
        buttons[1] = 1; #0.1; buttons[1] = 0; #20.01;
        
        //for ( int i = 0; i >= 0; i++) begin
            buttons[0] = 1'b1; //#0.1; buttons[0] = 1'b0; #2; // next
        //end
       
    end    
endmodule
