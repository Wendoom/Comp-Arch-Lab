`timescale 1ns/1ps
`include "mux3to1.v"

module tb_bit32_3to1mux;
    reg  [31:0] IN0, IN1, IN2;
    reg  [1:0]  SEL;
    wire [31:0] OUT;

    // Instantiate DUT
    bit32_3to1mux dut(OUT, SEL, IN0, IN1, IN2);

    initial begin
        // Test vectors
        IN0 = 32'hAAAAAAAA;  // 1010...
        IN1 = 32'h55555555;  // 0101...
        IN2 = 32'h12345678;  

        // Apply select values
        SEL = 2'b00; #50;  // Expect OUT = IN0
        SEL = 2'b01; #50;  // Expect OUT = IN1
        SEL = 2'b10; #50;  // Expect OUT = IN2
        SEL = 2'b11; #50;  // Expect OUT = IN2

        #100 $finish;
    end

    // Display changes
    initial begin
        $monitor("Time=%0t | SEL=%b | IN0=%h | IN1=%h | IN2=%h | OUT=%h",
                  $time, SEL, IN0, IN1, IN2, OUT);

        // For waveform viewing
        $dumpfile("tb_mux3to1.vcd");
        $dumpvars(0, tb_bit32_3to1mux);
    end
endmodule
