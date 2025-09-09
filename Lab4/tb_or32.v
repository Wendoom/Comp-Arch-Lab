`timescale 1ns/1ps
`include "or32.v"   

module tb32bitor;
    reg  [31:0] IN1, IN2;
    wire [31:0] OUT;

    // Instantiate DUT
    bit32OR dut(OUT, IN1, IN2);

    initial begin
        // Test 1
        IN1 = 32'hA5A5A5A5; 
        IN2 = 32'h5A5A5A5A; 
        #50;

        // Test 2
        IN1 = 32'hFFFFFFFF; 
        IN2 = 32'h00000000; 
        #50;

        // Test 3
        IN1 = 32'h12345678; 
        IN2 = 32'h87654321; 
        #50;

        // End simulation
        #100 $finish;
    end

    // Monitor signal changes
    initial begin
        $monitor("Time=%0t | IN1=%h | IN2=%h | OUT=%h", 
                  $time, IN1, IN2, OUT);

        // Optional waveform dump
        $dumpfile("tb_or32.vcd");
        $dumpvars(0, tb32bitor);
    end
endmodule
