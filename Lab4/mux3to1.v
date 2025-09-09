`include "mux_32bit.v"

module bit32_3to1mux(out, sel, in0, in1, in2);
    input  [31:0] in0, in1, in2;
    input  [1:0]  sel;       
    output [31:0] out;

    wire [31:0] w0, w1;

    
    bit32_2to1mux m0(w0, sel[0], in0, in1);

    bit32_2to1mux m1(out, sel[1], w0, in2);
endmodule
