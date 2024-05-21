`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2024 21:34:06
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;
// Inputs
    reg [7:0] operand1;
    reg [7:0] operand2;
    reg [1:0] alu_control;

    // Outputs
    wire [7:0] result;

    // Instantiate the ALU module
    ALU dut(
        .operand1(operand1),
        .operand2(operand2),
        .alu_control(alu_control),
        .result(result)
    );

    // Testcase
    initial begin
        // Test addition
        operand1 = 8'b00000001;
        operand2 = 8'b00000010;
        alu_control = 2'b00;
        #10;
        // Expected result: 3 (binary: 00000011)
        if (result == 8'b00000011) $display("Test Success for addition");
        else $display("Test fail for addition. The resul is %d", result);
        
        // Test subtraction
        operand1 = 8'b00000010;
        operand2 = 8'b00000001;
        alu_control = 2'b01;
        #10;
        // Expected result: 1 (binary: 00000001)
        if (result == 8'b00000001) $display("Test success for subtraction");
        else $display("Test fail for subtraction The resul is %d", result);
        
        // Test shift left logical (sll)
        operand1 = 8'b00000001;
        operand2 = 3'b010; // Shift left by 2 positions
        alu_control = 2'b10; // sll operation
        #10;
        // Expected result: 8'b00000100
        if (result == 8'b00000100) $display("Test success for shift left logical");
        else $display("Test fail for sll. The resul is %d", result);
        
        // Test bitwise AND
        operand1 = 8'b10101010;
        operand2 = 8'b11001100;
        alu_control = 2'b11; // bitwise AND operation
        #10;
        // Expected result: 8'b10001000
        if (result == 8'b10001000) $display("Test success for bitwise AND");
        else $display("Test fail for bitwise And. The resul is %d", result);
        $finish;
    end
endmodule
