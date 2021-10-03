`timescale 1ns / 1ps

module ReduceSum_module(input logic clk, enable, input logic [7:0] number, output logic [11:0] sum, output logic [3:0] readAddress );
        logic [4:0] count = 5'b0;
        localparam constant = 5'b10000;
        logic [11:0] Sum = 12'b0;
        typedef enum logic [1:0] {S0, S1, S2, S3} statetype; 
        statetype [1:0] state, nextState;


        // register 
        always_ff @(posedge clk)
        begin 
             state <= nextState; 
        end 

        // state transition
        always_ff @ (posedge clk)
        case(state) 
            S0: 
            begin 
                if (enable)
                    nextState <= S1;
                else
                    nextState <= S0; 
            end 

            S1: 
            begin 
                count <=  4'b0;
                Sum <= 12'b0;
                nextState <= S2;
            end 

            S2:
            begin
                if (count != constant) begin
                    Sum = Sum + number;
                    count = count + 1;
                    nextState <= S2;
                    end
                else 
                    nextState <= S3;
            end 

            S3: 
            begin 
                //Sum = Sum + number; 
                sum = Sum;
                nextState <= S0;
            end 
            default:
                nextState <= S0;
         endcase
         assign readAddress = count;
endmodule


























//module ReduceSum_module(input logic clk, enable, input logic [7:0] number, output logic [11:0] sum, output logic [3:0] readAddress);
//    localparam [4:0] constant = 5'b10000;
//    logic [4:0] count;
//    logic [11:0] Sum;
//    typedef enum logic [1:0] {S0, S1, S2, S3} statetype;
//    statetype state, nextstate;
    
//    // state register
//    always_ff @(posedge clk)
//    state <= nextstate;
//    always_ff @ (posedge clk)
//    // next state logic
//        case (state)
//            S0: if (enable) nextstate <= S1;
//                else nextstate <= S0;
//            S1:
//            begin
//                count <= 5'b0;
//                Sum <= 12'b0;
//                nextstate <= S2;
//                end
//            S2:
//            begin
//                if ( count != constant) begin
//                    readAddress <= count;
//                    Sum <= Sum + number;
//                    count <= count + 1;
//                    nextstate <= S2;
//                    end
//                else
//                    nextstate <= S3;
//             end
//            S3: 
//            begin
//                sum <= Sum;
//                nextstate <= S0;
//                end
//     endcase
//endmodule





















//    logic [3:0] count = 4'b0;
//    localparam constant = 4'b1111;
//    logic [11:0] Sum = 12'b0;

//    always @(posedge clk)
//    begin
//        if (count >= constant)
//        begin
//            count <= 4'b0; 
//            Sum <= 12'b0;
//        end

//        else begin
//            count <= count + 1;
//            Sum <= Sum + number;
//        end
//    end
    
//    always @(posedge clk)
//    begin
//        if ( count == constant)
//        begin
//            sum <= Sum;
//        end
//        readAddress <= count;
//    end
 //endmodule
