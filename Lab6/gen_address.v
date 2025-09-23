`include "jumpAddress.v"
`include "bit32Adder.v"
`include "prog_count.v"  


module PCJumpTop (
    input clk,
    input rst,
    input [25:0] instr_index,
    output [31:0] current_pc,
    output [31:0] jump_address
);

    wire [31:0] pc_plus_4;
    wire cout;

    // Program Counter instance
    ProgramCounter pc_inst (
        .clk(clk),
        .rst(rst),
        .next_pc(pc_plus_4),
        .current_pc(current_pc)
    );

    // PC + 4 adder instance
    bit32Adder adder_inst (
        .In1(current_pc),
        .In2(32'd4),
        .Cin(1'b0),
        .Sum(pc_plus_4),
        .Cout(cout)
    );

    // Jump Address calculation instance
    JumpAddress jump_inst (
        .pc_plus_4(pc_plus_4),
        .instr_index(instr_index),
        .jump_address(jump_address)
    );

endmodule
