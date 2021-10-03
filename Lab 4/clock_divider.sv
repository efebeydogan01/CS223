`timescale 1ns / 1ps

module clock_counter( input clk, input reset, output logic clock);
    localparam number = 150000000;
    
    logic [31:0] count;
 
    always @ (posedge(clk), posedge(reset))
    begin
        if (reset == 1'b1)
            count <= 32'b0;
        else if (count == number - 1)
            count <= 32'b0;
        else
            count <= count + 1;
     end

    always @ (posedge(clk), posedge(reset))
    begin
        if (reset == 1'b1)
            clock <= 1'b0;
        else if (count == number - 1)
            clock <= ~clock;
        else
            clock <= clock;
    end
endmodule
