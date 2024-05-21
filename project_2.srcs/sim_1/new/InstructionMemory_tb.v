`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2024 01:21:00
// Design Name: 
// Module Name: InstructionMemory_tb
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


module InstructionMemory_tb;
    parameter CLK_PERIOD = 10;
    reg clk = 0;
    reg [7:0] address;
    wire [7:0] instruction;

    InstructionMemory mut (.address(address), .instruction(instruction));
    
    always#((CLK_PERIOD)/2) clk = ~clk;
    
    initial begin
        #10;
        address = 8'h00;
        #10;
        $display("Instruction at address 0: %b", instruction);
        
        address = 8'h08;
        #10;
        $display("Instruction at address 8: %b", instruction);
        $finish;
    end

endmodule
