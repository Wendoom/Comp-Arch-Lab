module ProgramCounter(
    input clk,
    input rst,
    input [31:0] next_pc,
    output reg [31:0] current_pc
);
    initial begin
        current_pc = 32'h0000_0000; 
    end

    always @(posedge clk or posedge rst) begin
        if (rst)
            current_pc <= 32'h0000_0000;
        else
            current_pc <= next_pc;
    end
endmodule