`include "gen_address.v"

module PCJumpTop_tb;

    reg clk;
    reg rst;
    reg [25:0] instr_index;
    wire [31:0] current_pc;
    wire [31:0] jump_address;

    // Instantiate the DUT
    PCJumpTop uut (
        .clk(clk),
        .rst(rst),
        .instr_index(instr_index),
        .current_pc(current_pc),
        .jump_address(jump_address)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Initialize
        rst = 1;
        instr_index = 26'h0001234;  // example instr_index
        #15;

        rst = 0;  // release reset

        // Run for 10 clock cycles
        repeat (10) begin
            @(posedge clk);
            $display("Time: %0t | PC: 0x%08h | PC+4: 0x%08h | Jump Address: 0x%08h",
                      $time, current_pc, current_pc + 4, jump_address);
        end

        $finish;
    end

endmodule
