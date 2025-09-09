`include "adder32.v"

`timescale 1ns/1ps

module tb_bit32Adder;
    // Testbench signals
    reg  [31:0] IN1, IN2;
    reg         CIN;
    wire [31:0] SUM;
    wire        COUT;

    // DUT instantiation
    bit32Adder uut (
        .Cout(COUT),
        .Sum(SUM),
        .In1(IN1),
        .In2(IN2),
        .Cin(CIN)
    );

    initial begin
        // Display header
        $display("Time\tCIN\tIN1\t\tIN2\t\tSUM\t\t\tCOUT");

        // Monitor all signals
        $monitor("%0t\t%b\t%h\t%h\t%h\t%b",
                  $time, CIN, IN1, IN2, SUM, COUT);

        // Test cases
        CIN = 0; IN1 = 32'h00000000; IN2 = 32'h00000000; #10;  // 0 + 0
        CIN = 0; IN1 = 32'h00000001; IN2 = 32'h00000001; #10;  // 1 + 1
        CIN = 1; IN1 = 32'h00000001; IN2 = 32'h00000001; #10;  // 1 + 1 + carry
        CIN = 0; IN1 = 32'hFFFFFFFF; IN2 = 32'h00000001; #10;  // overflow case
        CIN = 1; IN1 = 32'hAAAAAAAA; IN2 = 32'h55555555; #10;  // pattern test
        CIN = 0; IN1 = 32'h12345678; IN2 = 32'h87654321; #10;  // random case

        #50 $finish;
    end
endmodule
