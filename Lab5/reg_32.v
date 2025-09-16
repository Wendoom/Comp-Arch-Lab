module reg_32bit(
    output reg [31:0] q,
    input      [31:0] d,
    input             clk,
    input             reset
);

    // On the positive edge of the clock or negative edge of reset
    always @(posedge clk or negedge reset) begin
        if (!reset) begin // Active-low reset
            q <= 32'b0;
        end else begin
            q <= d;
        end
    end

endmodule