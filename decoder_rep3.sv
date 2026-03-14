`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2026 01:06:16 PM
// Design Name: 
// Module Name: decoder_rep3
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


module decoder_rep3 (
    input  logic [3:0] syndrome,     // example: 4 syndrome bits
    output logic [2:0] correction    // 3-bit correction for 3 data qubits
);

    always_comb begin
        // default: no correction
        correction = 3'b000;

        case (syndrome)
            4'b0000: correction = 3'b000;
            4'b0001: correction = 3'b001;
            4'b0010: correction = 3'b100;
            4'b0011: correction = 3'b010;
            4'b0100: correction = 3'b001;
            4'b0101: correction = 3'b000;
            4'b0110: correction = 3'b010;
            4'b0111: correction = 3'b100;
            4'b1000: correction = 3'b100;
            4'b1001: correction = 3'b010;
            4'b1010: correction = 3'b000;
            4'b1011: correction = 3'b001;
            4'b1100: correction = 3'b010;
            4'b1101: correction = 3'b100;
            4'b1110: correction = 3'b001;
            4'b1111: correction = 3'b000;

            default: correction = 3'b000;
        endcase
    end

endmodule
