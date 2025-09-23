`include "shifter.v"

module JumpAddress (
    input  [31:0] pc_plus_4,
    input  [25:0] instr_index,
    output [31:0] jump_address
);

    wire [27:0] shifted_target;

    
    shiftLeft sl (
        .in(instr_index),
        .out(shifted_target)
    );

    assign jump_address = { pc_plus_4[31:28], shifted_target };

endmodule
