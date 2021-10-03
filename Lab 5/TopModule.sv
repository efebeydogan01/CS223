`timescale 1ns / 1ps

module TopModule( input logic clk, input logic [3:0] buttons, input logic [7:0] number,
    input logic [3:0] address, output logic [11:0] reduceSumSum, output logic [6:0] seg, output logic dp, output logic [3:0] an);
    
    logic [3:0] addressCounter;
    logic [3:0] reduceSumAddress;
    
    logic prev, next, enter, sum;
    
    logic [7:0] readData1, readData2;
    
    debounce previousButton(clk, buttons[3], prev);
    debounce nextButton(clk, buttons[2], next);
    debounce enterButton(clk, buttons[1], enter);
    debounce sumButton(clk, buttons[0], sum);
    
    always_ff @(posedge clk)
        begin
            if ( prev) begin
                if ( addressCounter == 4'b0000) begin
                    addressCounter <= 4'b1111;
                end
                else
                    addressCounter <= addressCounter - 1;
            end
            
            else if ( next) begin
                if ( addressCounter == 4'b1111)
                    addressCounter <= 4'b0000;
                else
                    addressCounter <= addressCounter + 1;
            end
      end
      
      memory_module mem( clk, enter, address, number, addressCounter, reduceSumAddress, readData1, readData2);
      SevSeg_4digit display( clk, addressCounter, 0, readData1[7:4], readData1[3:0], seg, dp, an);
      ReduceSum_module reduceSum(clk, sum, readData2, reduceSumSum, reduceSumAddress);
endmodule
