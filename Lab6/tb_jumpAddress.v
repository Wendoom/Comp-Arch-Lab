`include "jumpAddress.v"

module JumpAddress_tb;

    // Testbench signals
    reg  [31:0] pc_plus_4;
    reg  [25:0] instr_index;
    wire [31:0] jump_address;

    // Instantiate the module under test
    JumpAddress uut (
        .pc_plus_4(pc_plus_4),
        .instr_index(instr_index),
        .jump_address(jump_address)
    );

    initial begin
        // Test case 1
        pc_plus_4 = 32'h1000_0004;        // PC+4 example address
        instr_index = 26'h3FFFFFF;        // max 26-bit value (all ones)
        #10;
        $display("Test 1:");
        $display("PC+4 = 0x%08h, instr_index = 0x%07h", pc_plus_4, instr_index);
        $display("Jump Address = 0x%08h", jump_address);
        
        // Test case 2
        pc_plus_4 = 32'h2000_0000;
        instr_index = 26'h0001234;        // some arbitrary instruction index
        #10;
        $display("Test 2:");
        $display("PC+4 = 0x%08h, instr_index = 0x%07h", pc_plus_4, instr_index);
        $display("Jump Address = 0x%08h", jump_address);

        // Test case 3
        pc_plus_4 = 32'hF000_0000;
        instr_index = 26'h0000001;        // minimal instr_index
        #10;
        $display("Test 3:");
        $display("PC+4 = 0x%08h, instr_index = 0x%07h", pc_plus_4, instr_index);
        $display("Jump Address = 0x%08h", jump_address);

        $finish;  // End simulation
    end

endmodule
