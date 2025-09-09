`include "mux.v"
module bit8_2to1mux (out, sel, in1, in2);
    input [7:0] in1, in2;
    output [7:0] out;
    input sel;
    
    // Using a generate for loop for cleaner code
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin: mux_loop
            mux2to1 m_inst(out[i], sel, in1[i], in2[i]);
        end
    endgenerate
endmodule
