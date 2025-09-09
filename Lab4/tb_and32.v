`timescale 1ns/1ps
`include "and32.v"

module tb32bitand; 
    reg [31:0] IN1, IN2; 
    wire [31:0] OUT; 

    // Instantiate DUT
    bit32AND a1 (OUT, IN1, IN2); 

    initial begin 
        IN1 = 32'hA5A5; 
        IN2 = 32'h5A5A; 
        #100 IN1 = 32'h5A5A; 
        #400 $finish; 
    end 

    // Print whenever a signal changes
    initial begin
        $monitor("Time=%0t | IN1=%h | IN2=%h | OUT=%h", 
                  $time, IN1, IN2, OUT);

        // Optional: dump waveform for GTKWave
        $dumpfile("tb_and32.vcd");
        $dumpvars(0, tb32bitand);
    end
endmodule
