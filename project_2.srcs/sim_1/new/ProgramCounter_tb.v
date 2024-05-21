`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2024 00:55:40
// Design Name: 
// Module Name: ProgramCounter_tb
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


module ProgramCounter_tb;

    parameter CLK_PERIOD = 10;
    reg clk = 0;            // Clock signal
    reg reset = 1;          // Reset signal (active low)
    reg [7:0] next_address; // Input for updating the Program Counter
    wire [7:0] current_address; // Output representing the current address
    
    ProgramCounter dut (
        .clk(clk),
        .reset(reset),
        .next_address(next_address),
        .current_address(current_address)
    );
    always #((CLK_PERIOD)/2) clk = ~clk;
    // Testbench stimulus
    initial begin

        #10;
        reset = 1;
        // Wait for a few clock cycles
        #10;
        next_address = 8'h10;
        #10;
        reset = 0;
        next_address = 8'hFF;
        #10;
        $finish;
    end

endmodule
