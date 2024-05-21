`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2024 02:39:05
// Design Name: 
// Module Name: AddressAdder
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


module AddressAdder(
    input clk,                      // Clock input
    input reset,                    // Reset input
    input [7:0] current_address,
    output reg [7:0] new_address
);

    always @(posedge clk or current_address or negedge reset) begin
        if (!reset) begin
            new_address <= 8'h00; // Reset the result to 0
        end else 
            new_address <= current_address + 1;
        end
    
endmodule
