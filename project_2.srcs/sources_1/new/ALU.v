`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2024 21:29:55
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [7:0] operand1, operand2,
    input [1:0] alu_control,
    output reg [7:0] result
    );
    
    always @(*) 
    begin
        case (alu_control)
            2'b00: result <= operand1 + operand2; // add
            2'b01: result <= operand1 - operand2; // subtract
            2'b10: result <= operand1 << operand2; // shift left logical
            2'b11: result <= operand1 & operand2; // bitwise AND
            default: result <= 8'h00; // Default to 0
        endcase
    end
endmodule
