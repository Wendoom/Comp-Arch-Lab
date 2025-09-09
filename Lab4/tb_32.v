`include "mux_32bit.v"

module tb_8bit2to1mux; 
    reg [31:0] INP1, INP2; 
    reg SEL; 
    wire [31:0] OUT; 

    // Instantiate 8-bit 2:1 mux
    bit32_2to1mux M1(OUT, SEL, INP1, INP2); 

    initial begin 
        INP1 = 32'b10101010101010101010101010101010; 
        INP2 = 32'b01010101010101010101010101010101; 
        SEL  = 1'b0; 
        #100 SEL = 1'b1; 
        #1000 $finish; 
    end 

    // Print signals during simulation
    initial begin
        $monitor("Time=%0t | SEL=%b | INP1=%b | INP2=%b | OUT=%b", 
                  $time, SEL, INP1, INP2, OUT);
    end
endmodule
