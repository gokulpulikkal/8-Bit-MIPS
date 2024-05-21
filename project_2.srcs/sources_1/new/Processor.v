`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2024 01:44:22
// Design Name: 
// Module Name: Processor
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

module Processor(
    input clk,        // Clock input
    input reset,      // Reset input
    input regWrite,
    output [7:0] result
    );
    
    wire [7:0] next_instruction_address;
    wire [7:0] instruction_address;
    wire [7:0] instruction;
    wire [1:0] register_rs;
    wire [1:0] register_rt;
    wire [7:0] operand_one;
    wire [7:0] operand_two;
    
    ProgramCounter PC (
        .clk(clk),
        .reset(reset),
        .next_address(next_instruction_address),
        .current_address(instruction_address)
    );
    
    AddressAdder adder (
        .clk(clk),
        .reset(reset),
        .current_address(instruction_address),
        .new_address(next_instruction_address)
    );
    
    InstructionMemory instruction_memory(
        .address(instruction_address),
        .instruction(instruction)
    );
    
    Instruction_decoder instruction_decoder (
        .instruction(instruction),
        .register_rs(register_rs),
        .register_rt(register_rt)
    );
    
    Register_file register_file (
        .clk(clk),
        .reset(reset),
        .regWrite(regWrite),
        .register_write_data(result),
        .register_rs(register_rs),
        .register_rt(register_rt),
        .operand_one(operand_one),
        .operand_two(operand_two)
    );
    
    wire [1:0] alu_control = 00;
    ALU alu (
        .operand1(operand_one),
        .operand2(operand_two),
        .alu_control(alu_control),
        .result(result)
    );
    
endmodule
