`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2024 01:56:50
// Design Name: 
// Module Name: Processor_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Processor_tb;
    reg clk = 0;
    reg reset;
    reg regWrite = 0;
    wire [7:0] result;
    
    parameter CLK_PERIOD = 10;
    
    Processor mut (
        .clk(clk),
        .reset(reset),
        .result(result)
    );
    
    always #((CLK_PERIOD)/2) clk = ~clk;
    initial begin
        reset = 1;
        #1;
        reset = 0;
        #1
        reset = 1;
    end
    
    initial begin
        // Wait for a few clock cycles
        #6;
        $display("result value after 6 time units: %h", result);
        regWrite = 1;
        #6
        $display("result value after 6 time units: %h", result);
//        #5
//        $display("result value after 5 time units: %h", result);
//        #5
//        $display("result value after 5 time units: %h", result);
//        #5
//        $display("result value after 5 time units: %h", result);
//        #5
//        $display("result value after 5 time units: %h", result);
//        #5
//        $display("result value after 5 time units: %h", result);
//        #5
//        $display("result value after 5 time units: %h", result);
//        #5
//        $display("result value after 5 time units: %h", result);
//        #5
//        $display("result value after 5 time units: %h", result);
        #5
        $finish;

    end
    
endmodule
