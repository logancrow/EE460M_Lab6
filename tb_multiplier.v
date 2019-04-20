`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2019 01:02:35 PM
// Design Name: 
// Module Name: tb_multiplier
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


module tb_multiplier();
    reg [7:0] A;
    reg [7:0] B;
    
    wire [7:0] C;
    
    adder u1(
    .A(A),
    .B(B),
    .C(C)
    );
    
    initial
    begin
    
    A = 8'b01110000;
    B = 8'b01010000;
    
    #10;
    
    A = 8'b01000000;
    B = 8'b01110000;
    
    #10;
    
    A = 8'b11110000;
    B = 8'b01010000;
    
    #10;
    
    A = 8'b01110000;
    B = 8'b11010000;
    
    #10;
    
    A = 8'b11110000;
    B = 8'b11010000;
    
    end

endmodule
