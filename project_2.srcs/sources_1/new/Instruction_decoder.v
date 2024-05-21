`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2024 18:57:40
// Design Name: 
// Module Name: Instruction_decoder
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


module Instruction_decoder(
    input [7:0] instruction,
    output reg [1:0] register_rs,
    output reg [1:0] register_rt
    );
   
  reg [1:0] opcode;
  always @(*) begin 
    opcode <= instruction[7:6];
    if(opcode == 2'b00) begin
        register_rt <= instruction[5:4];
        register_rs <= instruction[3:2];
    end  
    else begin
        register_rt <= instruction[5:4];
        register_rs <= instruction[3:2];
    end
  end
endmodule
