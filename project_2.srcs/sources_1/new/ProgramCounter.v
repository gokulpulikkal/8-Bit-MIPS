`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2024 00:38:44
// Design Name: 
// Module Name: ProgramCounter
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


module ProgramCounter(
    input clk,        // Clock input
    input reset,      // Reset input
    input [7:0] next_address,  // Input for updating the Program Counter to a specific address
    output reg [7:0] current_address  // Output representing the current address
    );
    
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            // Reset the Program Counter to address 0
            current_address <= 8'b00000000;
        end else begin
            // Update the Program Counter to the next address on each rising edge of the clock
            current_address <= next_address;
        end
    end
endmodule
