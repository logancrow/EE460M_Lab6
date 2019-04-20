`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2019 01:34:48 PM
// Design Name: 
// Module Name: multiplier
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
