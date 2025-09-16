`include "reg_32.v"
module tb32reg;
    reg [31:0] d;
    reg clk, reset;
    wire [31:0] q;

    reg_32bit R(q, d, clk, reset);

    // Clock generator: toggles every 5 time units
    always #5 clk = ~clk;

    initial begin
        // Monitor output
        $monitor("Time = %0t | clk = %b | reset = %b | d = %h | q = %h", $time, clk, reset, d, q);

        // Initial values
        clk = 1'b1;
        reset = 1'b0;         // Assert reset (active low)
        d = 32'h00000000;     // Initial input

        #20 reset = 1'b1;     // Deassert reset
        #20 d = 32'hAFAFAFAF; // Set input data
        #200 $finish;         // End simulation
    end
endmodule
