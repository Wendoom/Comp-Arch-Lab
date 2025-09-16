module d_ff(q, d, clk, reset);
    input d, clk, reset;
    output q;
    reg q;

    always @(posedge clk)
    begin
        if (!reset)       // Active-low reset
            q <= 1'b0;
        else
            q <= d;
    end
endmodule
