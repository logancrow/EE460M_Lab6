`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2019 01:31:11 AM
// Design Name: 
// Module Name: matrixmultiplier
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


module matrixmultiplier(
    input clk,
    input [7:0] A00, A01, A02, B00, B01, B02, A10, A11, A12, B10, B11, B12, A20, A21, A22, B20, B21, B22,  
    inout [7:0] C00, C01, C02, C10, C11, C12, C20, C21, C22
    );
    
    wire [7:0] C00_next, C01_next, C02_next, C10_next, C11_next, C12_next, C20_next, C21_next, C22_next;
    wire [7:0] C00_in, C01_in, C02_in, C10_in, C11_in, C12_in, C20_in, C21_in, C22_in;
    wire [7:0] AC00_in, BC00_in, AC01_in, BC01_in, AC02_in, BC02_in, AC10_in, BC10_in, AC11_in, BC11_in, AC12_in, BC12_in, AC20_in, BC20_in, AC21_in, BC21_in, AC22_in, BC22_in;
    reg [7:0] AC00, BC00, AC01, BC01, AC02, BC02, AC10, BC10, AC11, BC11, AC12, BC12, AC20, BC20, AC21, BC21, AC22, BC22;
    reg [7:0] C00_out, C01_out, C02_out, C10_out, C11_out, C12_out, C20_out, C21_out, C22_out;
    reg [3:0] cycle_count;
    
    assign {AC00_in,BC00_in,AC01_in,BC01_in,AC02_in,BC02_in,AC10_in,BC10_in,AC11_in,BC11_in,AC12_in,BC12_in,AC20_in,BC20_in,AC21_in,BC21_in,AC22_in,BC22_in} = {AC00,BC00,AC01,BC01,AC02,BC02,AC10,BC10,AC11,BC11,AC12,BC12,AC20,BC20,AC21,BC21,AC22,BC22};
    assign {C00,C01,C02,C10,C11,C12,C20,C21,C22} = {C00_out,C01_out,C02_out,C10_out,C11_out,C12_out,C20_out,C21_out,C22_out};
    
    MAC m0 (AC00_in,BC00_in,C00,C00_next);
    MAC m1 (AC01_in,BC01_in,C01,C01_next);
    MAC m2 (AC02_in,BC02_in,C02,C02_next);
    MAC m3 (AC10_in,BC10_in,C10,C10_next);
    MAC m4 (AC11_in,BC11_in,C11,C11_next);
    MAC m5 (AC12_in,BC12_in,C12,C12_next);
    MAC m6 (AC20_in,BC20_in,C20,C20_next);
    MAC m7 (AC21_in,BC21_in,C21,C21_next);
    MAC m8 (AC22_in,BC22_in,C22,C22_next);                            
    
    initial begin
        {C00_out,C01_out,C02_out,C10_out,C11_out,C12_out,C20_out,C21_out,C22_out} = 72'h000000000000000000;
        cycle_count = 0;
    end
    
    always@(*) begin
        case(cycle_count)
            4'b0000 : begin 
                    AC00 = 0; BC00 = 0;
                    AC01 = 0; BC01 = 0;
                    AC02 = 0; BC02 = 0;
                    AC10 = 0; BC10 = 0;
                    AC11 = 0; BC11 = 0;
                    AC12 = 0; BC12 = 0;
                    AC20 = 0; BC20 = 0;
                    AC21 = 0; BC21 = 0;
                    AC22 = 0; BC22 = 0;
                 end
            4'b0001 : begin 
                        AC00 = A00; BC00 = B00;
                        AC01 = 0; BC01 = 0;
                        AC02 = 0; BC02 = 0;
                        AC10 = 0; BC10 = 0;
                        AC11 = 0; BC11 = 0;
                        AC12 = 0; BC12 = 0;
                        AC20 = 0; BC20 = 0;
                        AC21 = 0; BC21 = 0;
                        AC22 = 0; BC22 = 0;
                      end
            4'b0010 : begin 
                        AC00 = A01; BC00 = B10;
                        AC01 = A00; BC01 = B01;
                        AC02 = 0; BC02 = 0;
                        AC10 = A10; BC10 = B00;
                        AC11 = 0; BC11 = 0;
                        AC12 = 0; BC12 = 0;
                        AC20 = 0; BC20 = 0;
                        AC21 = 0; BC21 = 0;
                        AC22 = 0; BC22 = 0;
                      end
            4'b0011 : begin 
                        AC00 = A02; BC00 = B20;
                        AC01 = A01; BC01 = B11;
                        AC02 = A00; BC02 = B02;
                        AC10 = A11; BC10 = B10;
                        AC11 = A10; BC11 = B01;
                        AC12 = 0; BC12 = 0;
                        AC20 = A20; BC20 = B00;
                        AC21 = 0; BC21 = 0;
                        AC22 = 0; BC22 = 0;
                      end
            4'b0100 : begin 
                        AC00 = 0; BC00 = 0;
                        AC01 = A02; BC01 = B21;
                        AC02 = A01; BC02 = B12;
                        AC10 = A12; BC10 = B20;
                        AC11 = A11; BC11 = B11;
                        AC12 = A10; BC12 = B02;
                        AC20 = A21; BC20 = B10;
                        AC21 = A20; BC21 = B01;
                        AC22 = 0; BC22 = 0;
                     end
            4'b0101 : begin 
                        AC00 = 0; BC00 = 0;
                        AC01 = 0; BC01 = 0;
                        AC02 = A02; BC02 = B22;
                        AC10 = 0; BC10 = 0;
                        AC11 = A12; BC11 = B21;
                        AC12 = A11; BC12 = B12;
                        AC20 = A22; BC20 = B20;
                        AC21 = A21; BC21 = B11;
                        AC22 = A20; BC22 = B02;
                     end
            4'b0110 : begin 
                        AC00 = 0; BC00 = 0;
                        AC01 = 0; BC01 = 0;
                        AC02 = 0; BC02 = 0;
                        AC10 = 0; BC10 = 0;
                        AC11 = 0; BC11 = 0;
                        AC12 = A12; BC12 = B22;
                        AC20 = 0; BC20 = 0;
                        AC21 = A22; BC21 = B21;
                        AC22 = A21; BC22 = B12;
                     end
            4'b0111 : begin 
                        AC00 = 0; BC00 = 0;
                        AC01 = 0; BC01 = 0;
                        AC02 = 0; BC02 = 0;
                        AC10 = 0; BC10 = 0;
                        AC11 = 0; BC11 = 0;
                        AC12 = 0; BC12 = 0;
                        AC20 = 0; BC20 = 0;
                        AC21 = 0; BC21 = 0;
                        AC22 = A22; BC22 = B22;
                     end
            4'b1000 : begin 
                        AC00 = 0; BC00 = 0;
                        AC01 = 0; BC01 = 0;
                        AC02 = 0; BC02 = 0;
                        AC10 = 0; BC10 = 0;
                        AC11 = 0; BC11 = 0;
                        AC12 = 0; BC12 = 0;
                        AC20 = 0; BC20 = 0;
                        AC21 = 0; BC21 = 0;
                        AC22 = 0; BC22 = 0;
                     end
        endcase
    end
    
    always@(posedge clk) begin
        if(cycle_count <= 8) cycle_count = cycle_count + 1;
        {C00_out,C01_out,C02_out,C10_out,C11_out,C12_out,C20_out,C21_out,C22_out} = {C00_next,C01_next,C02_next,C10_next,C11_next,C12_next,C20_next,C21_next,C22_next};
    end
    
endmodule


//adds 2 8 bit floating point numbers
module adder(
    input [7:0] A, B,
    output reg [7:0] C
    );

    reg [12:0] shfsum;
    reg [4:0] Afrac, Bfrac;
    wire [2:0] Ashf, Bshf;
    
    assign Ashf = A[6:4];
    assign Bshf = B[6:4];
    
    always@(*) begin
        if(A[6:4] == 3'b000) Afrac = {1'b0,A[3:0]};
            else Afrac = {1'b1,A[3:0]};
        if(B[6:4] == 3'b000) Bfrac = {1'b0,B[3:0]};
                else Bfrac = {1'b1,B[3:0]};   
             
        if(Ashf >= Bshf) begin
            case({A[7],B[7]})
                2'b00: begin shfsum = (Afrac << Ashf) + (Bfrac << Bshf); C[7] = 0; end
                2'b01: begin shfsum = (Afrac << Ashf) - (Bfrac << Bshf); C[7] = 0; end 
                2'b10: begin shfsum = (Afrac << Ashf) - (Bfrac << Bshf); C[7] = 1; end
                2'b11: begin shfsum = (Afrac << Ashf) + (Bfrac << Bshf); C[7] = 1; end 
            endcase      
        end else begin
            case({A[7],B[7]})
                2'b00: begin shfsum = (Bfrac << Bshf) + (Afrac << Ashf); C[7] = 0; end
                2'b01: begin shfsum = (Bfrac << Bshf) - (Afrac << Ashf); C[7] = 1; end 
                2'b10: begin shfsum = (Bfrac << Bshf) - (Afrac << Ashf); C[7] = 0; end
                2'b11: begin shfsum = (Bfrac << Bshf) + (Afrac << Ashf); C[7] = 1; end 
            endcase
        end
        if(shfsum[11]) begin C[6:4] = 7; C[3:0] = shfsum[10:7]; end
            else if(shfsum[10]) begin C[6:4] = 6; C[3:0] = shfsum[9:6]; end
                else if(shfsum[9]) begin C[6:4] = 5; C[3:0] = shfsum[8:5]; end
                    else if(shfsum[8]) begin C[6:4] = 4; C[3:0] = shfsum[7:4]; end
                        else if(shfsum[7]) begin C[6:4] = 3; C[3:0] = shfsum[6:3]; end
                            else if(shfsum[6]) begin C[6:4] = 2; C[3:0] = shfsum[5:2]; end
                                else if(shfsum[5]) begin C[6:4] = 1; C[3:0] = shfsum[4:1]; end
                                    else begin C[6:4] = 0; C[3:0] = shfsum[3:0]; end                                          
    end
    
endmodule


//multiplies 2 8 bit floating point numbers
module multiplier(
    input [7:0] A, B,
    output reg [7:0] C
    );
    
    wire [23:0] shfprod;
    wire [3:0] shf;
    reg [4:0] Afrac, Bfrac;
    
    assign shf = A[6:4] + B[6:4];
    
    assign shfprod = ((Afrac * Bfrac) << shf);
    
    always@(*) begin
        if(A[6:4] == 3'b000) Afrac = {1'b0,A[3:0]};
            else Afrac = {1'b1,A[3:0]};
        if(B[6:4] == 3'b000) Bfrac = {1'b0,B[3:0]};
                else Bfrac = {1'b1,B[3:0]};
                
        if(shfprod[18]) begin C[6:4] = 7; C[3:0] = shfprod[17:14]; end
            else if(shfprod[17]) begin C[6:4] = 6; C[3:0] = shfprod[16:13]; end
                else if(shfprod[16]) begin C[6:4] = 5; C[3:0] = shfprod[15:12]; end
                    else if(shfprod[15]) begin C[6:4] = 4; C[3:0] = shfprod[14:11]; end
                        else if(shfprod[14]) begin C[6:4] = 3; C[3:0] = shfprod[13:10]; end
                            else if(shfprod[13]) begin C[6:4] = 2; C[3:0] = shfprod[12:9]; end
                                else if(shfprod[12]) begin C[6:4] = 1; C[3:0] = shfprod[11:8]; end
                                    else begin C[6:4] = 0; C[3:0] = shfprod[10:7]; end
    C[7] = A[7] ^ B[7];
    end
    
endmodule

//D= A*B + C
module MAC(
    input [7:0] A, B, C, 
    inout [7:0] D
    );
    
    wire [7:0] AXB;
    
    multiplier p0 (AXB,A,B);
    
    adder a0 (D,C,AXB);
    
endmodule