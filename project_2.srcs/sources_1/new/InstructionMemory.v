`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2024 01:11:57
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
    input [7:0] address,
    output reg [7:0] instruction
    );
    
    reg [7:0] mem [0:255];
    initial begin
        mem[0] = 8'b00010001;
        mem[1] = 8'b00010001;
        mem[2] = 8'b00000010;
        mem[3] = 8'b00000100;
        mem[4] = 8'b01000101;
        mem[5] = 8'b00000110;
        mem[6] = 8'b00000111;
        mem[7] = 8'b00001000;
        mem[8] = 8'b00001001;
        mem[9] = 8'b00001010;
    end
    
    always @(address) begin
        // Read the instruction from memory based on the address input
        instruction = mem[address];
    end
endmodule
