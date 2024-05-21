`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2024 21:18:39
// Design Name: 
// Module Name: Register_file_tb
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


module Register_file_tb;
    reg clk = 0;
    reg reset;
    reg regWrite;
    reg [7:0] register_write_data;
    reg [1:0] register_rs;
    reg [1:0] register_rt;
    wire [7:0] operand_one;
    wire [7:0] operand_two;
    
    parameter CLK_PERIOD = 10;
    
    // Instantiate the Register_file module
    Register_file reg_file (
        .clk(clk),
        .reset(reset),
        .regWrite(regWrite),
        .register_write_data(register_write_data),
        .register_rs(register_rs),
        .register_rt(register_rt),
        .operand_one(operand_one),
        .operand_two(operand_two)
    );

    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Reset assertion
    initial begin
        reset = 1;
        #2;
        reset = 0;
        #2;
        reset = 1;
    end

    // Testcase
    initial begin
//        // Read from register 0 and 1
//        register_rs = 2'b00;
//        register_rt = 2'b01;
//        #6;
//        $display("first operand value is %h ", operand_one);
//        $display("second operand value is %h ", operand_two);
        #11
        // Read from register 2 and 3
        regWrite = 1'b1;
        register_rs = 2'b10;
        register_rt = 2'b11;
        #3
        $display("first operand value is %h ", operand_one);
        $display("second operand value is %h ", operand_two);
        register_write_data = 8'b11001100;
        #6
        regWrite = 1'b0;
        // Write operation
        register_rs = 2'b11;
        register_rt = 2'b10;
        #3
        $display("first operand value is %h ", operand_one);
        $display("second operand value is %h ", operand_two);
        #10
        $finish;
    end
endmodule
