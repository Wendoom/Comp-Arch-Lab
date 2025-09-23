module bit32Adder (Cout, Sum, In1, In2, Cin);
    input  [31:0] In1, In2;
    input         Cin;
    output [31:0] Sum;
    output        Cout;

    assign {Cout, Sum} = In1 + In2 + Cin;
endmodule
