`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2024 20:58:02
// Design Name: 
// Module Name: Register_file
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


module Register_file(
    input clk,
    input reset,      // Reset input
    input regWrite,
    input [7:0] register_write_data,
    input [1:0] register_rs,
    input [1:0] register_rt,
    output [7:0] operand_one,
    output [7:0] operand_two
    );
    
    reg [7:0] reg_mem [0:3];
    initial begin
        reg_mem[0] = 8'b00000001;
        reg_mem[1] = 8'b00000000;
        reg_mem[2] = 8'b00000000;
        reg_mem[3] = 8'b00000000;
    end
    
    integer i;
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            // TODO: Reset the register file list
            $display("Refreshing Register memory");
            for (i = 0; i < 8; i = i + 1) begin
//                reg_mem[i] = 8'b00000000;
            end
        end else begin
            if (regWrite) begin
                $display("Writing data to the register and the data is %h", register_write_data);
                reg_mem[register_rt] <= register_write_data;
            end
        end
    end
    
    assign operand_one = reg_mem[register_rs];
    assign operand_two = reg_mem[register_rt];
    
endmodule
