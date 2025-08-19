module compare_df (
    input a0, a1, a2, a3,
    input b0, b1, b2, b3,
    output greater,
    output equal,
    output lesser
);

    
    wire [3:0] A = {a0, a1, a2, a3};
    wire [3:0] B = {b0, b1, b2, b3};

    assign greater = (A > B);
    assign equal   = (A == B);
    assign lesser  = (A < B);

endmodule
