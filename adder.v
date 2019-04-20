`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2019 12:06:42 PM
// Design Name: 
// Module Name: adder
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


//adds 2 8 bit floating point numbers
module adder(
    input [7:0] A, B,
    output reg [7:0] C
    );

    reg [12:0] shfsum;
    wire [4:0] Afrac, Bfrac;
    wire [2:0] Ashf, Bshf;
    
    assign Afrac = {1'b1,A[3:0]};
    assign Bfrac = {1'b1,B[3:0]};
    assign Ashf = A[6:4];
    assign Bshf = B[6:4];
    
    always@(*) begin
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
