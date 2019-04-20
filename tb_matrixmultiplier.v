`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2019 03:48:36 PM
// Design Name: 
// Module Name: tb_matrixmultiplier
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


module tb_matrixmultiplier();

    reg clk;
    reg [7:0] A00;
    reg [7:0] A01;
    reg [7:0] A02;
    reg [7:0] B00;
    reg [7:0] B01;
    reg [7:0] B02;
    reg [7:0] A10;
    reg [7:0] A11;
    reg [7:0] A12;
    reg [7:0] B10;
    reg [7:0] B11;
    reg [7:0] B12;
    reg [7:0] A20;
    reg [7:0] A21;
    reg [7:0] A22;
    reg [7:0] B20;
    reg [7:0] B21;
    reg [7:0] B22;
    wire [7:0] C00;
    wire [7:0] C01;
    wire [7:0] C02;
    wire [7:0] C10;
    wire [7:0] C11;
    wire [7:0] C12;
    wire [7:0] C20;
    wire [7:0] C21;
    wire [7:0] C22;
    
    matrixmultiplier u1 (
        .clk(clk),
        .A00(A00),
        .A01(A01),
        .A02(A02),
        .B00(B00),
        .B01(B01),
        .B02(B02),
        .A10(A10),
        .A11(A11),
        .A12(A12),
        .B10(B10),
        .B11(B11),
        .B12(B12),
        .A20(A20),
        .A21(A21),
        .A22(A22),
        .B20(B20),
        .B21(B21),
        .B22(B22),
        .C00(C00),
        .C01(C01),
        .C02(C02),
        .C10(C10),
        .C11(C11),
        .C12(C12),
        .C20(C20),
        .C21(C21),
        .C22(C22)
    );
    
    initial begin
        clk = 0;
        A00 = 8'b00110000;
        A01 = 8'b01000000;
        A02 = 8'b11001000;
        A10 = 8'b00110000;
        A11 = 8'b10110000;
        A12 = 8'b00110000;
        A20 = 8'b01001000;
        A21 = 8'b01000000;
        A22 = 8'b00110000;
        B00 = 8'b00110000;
        B01 = 8'b01001000;
        B02 = 8'b10110000;
        B10 = 8'b11000000;
        B11 = 8'b01000000;
        B12 = 8'b01000000;
        B20 = 8'b01001000;
        B21 = 8'b00110000;
        B22 = 8'b11001000;
        
    end
    
    always #1000 clk= ~clk;
endmodule
