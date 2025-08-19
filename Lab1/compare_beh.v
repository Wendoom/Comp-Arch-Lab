module compare_beh(
    input a0, a1, a2, a3,
    input b0, b1, b2, b3,
    output reg greater, equal, lesser
);
    always @(*) begin
        greater = 0;
        lesser = 0;
        equal = 0;

        if (a0 > b0) greater = 1;
        else if (a0 < b0) lesser = 1;
        else if (a1 > b1) greater = 1;
        else if (a1 < b1) lesser = 1;
        else if (a2 > b2) greater = 1;
        else if (a2 < b2) lesser = 1;
        else if (a3 > b3) greater = 1;
        else if (a3 < b3) lesser = 1;
        else equal = 1;
    end
endmodule
