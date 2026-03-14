`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2026 01:06:16 PM
// Design Name: 
// Module Name: tb_decoder_rep3
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


module tb_decoder_rep3;

    logic [3:0] syndrome;
    logic [2:0] correction;
    logic [2:0] expected;

    int errors = 0;

    decoder_rep3 dut (
        .syndrome(syndrome),
        .correction(correction)
    );

    task run_test(
        input logic [3:0] syn,
        input logic [2:0] exp_corr
    );
    begin
        syndrome  = syn;
        expected  = exp_corr;
        #1;

        if (correction !== expected) begin
            $display("FAIL: syndrome=%b expected=%b got=%b", syndrome, expected, correction);
            errors++;
        end
        else begin
            $display("PASS: syndrome=%b correction=%b", syndrome, correction);
        end
    end
    endtask

    initial begin
        $display("Starting decoder testbench...");
        run_test(4'b0000, 3'b000);
        run_test(4'b0001, 3'b001);
        run_test(4'b0010, 3'b100);
        run_test(4'b0011, 3'b010);
        run_test(4'b0100, 3'b001);
        run_test(4'b0101, 3'b000);
        run_test(4'b0110, 3'b010);
        run_test(4'b0111, 3'b100);
        run_test(4'b1000, 3'b100);
        run_test(4'b1001, 3'b010);
        run_test(4'b1010, 3'b000);
        run_test(4'b1011, 3'b001);
        run_test(4'b1100, 3'b010);
        run_test(4'b1101, 3'b100);
        run_test(4'b1110, 3'b001);
        run_test(4'b1111, 3'b000);

        $display("Total errors = %0d", errors);
        $finish;
    end

endmodule
