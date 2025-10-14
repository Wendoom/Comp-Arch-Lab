`timescale 1ns/1ps
`include "mainController.v"
module tb_controller;


    reg [5:0] Op;
    reg [3:0] current_state;
    reg clk, reset;

    wire [3:0] next_state;
    wire RegDst, RegWrite, ALUSrcA, MemtoReg, IRWrite, MemWrite, MemRead, IorD, PCWriteCond, PCWrite;
    wire [1:0] ALUSrcB, ALUOp, PCSource;

 
    main_controller DUT (
        .Op(Op),
        .S(current_state),
        .NS(next_state),
        .RegDst(RegDst),
        .RegWrite(RegWrite),
        .ALUSrcA(ALUSrcA),
        .ALUSrcB(ALUSrcB),
        .ALUOp(ALUOp),
        .PCSource(PCSource),
        .MemtoReg(MemtoReg),
        .IRWrite(IRWrite),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .IorD(IorD),
        .PCWriteCond(PCWriteCond),
        .PCWrite(PCWrite)
    );
    

    parameter LW = 6'b100011;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= 4'b0000;
        else
            current_state <= next_state;
    end

    initial begin
        
        $display("-----------------------------------------------------");
        $display("Starting Testbench for LW instruction");
        $display("-----------------------------------------------------");
        reset = 1;
        Op = LW; 
        #15; 
        reset = 0;

        
        $monitor("Time = %0t ns | State = %d | Op = %b | MemRead = %b | MemWrite = %b | RegWrite = %b | PCWrite = %b | NS = %d", 
                  $time, current_state, Op, MemRead, MemWrite, RegWrite, PCWrite, next_state);


        #100; 

        
        $display("\n-----------------------------------------------------");
        $display("Testbench for LW instruction finished.");
        $display("-----------------------------------------------------");
        $finish;
    end

endmodule