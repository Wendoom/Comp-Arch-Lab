module main_controller (
    
    input [5:0] Op, 
    input [3:0] S,

    
    output reg [3:0] NS, 
    output reg RegDst,
    output reg RegWrite,
    output reg ALUSrcA,
    output reg [1:0] ALUSrcB,
    output reg [1:0] ALUOp,
    output reg [1:0] PCSource,
    output reg MemtoReg,
    output reg IRWrite,
    output reg MemWrite,
    output reg MemRead,
    output reg IorD,
    output reg PCWriteCond,
    output reg PCWrite
);

  
    parameter R_TYPE = 6'b000000;
    parameter JUMP = 6'b000010;
    parameter BEQ = 6'b000100;
    parameter LW = 6'b100011;
    parameter SW = 6'b101011;

    
    parameter S0 = 4'b0000; 
    parameter S1 = 4'b0001; 
    parameter S2 = 4'b0010; 
    parameter S3 = 4'b0011; 
    parameter S4 = 4'b0100; 
    parameter S5 = 4'b0101; 
    parameter S6 = 4'b0110;
    parameter S7 = 4'b0111; 
    parameter S8 = 4'b1000; 
    parameter S9 = 4'b1001; 
	
    always @(*) begin
        
        {RegDst, RegWrite, ALUSrcA, ALUSrcB, ALUOp, PCSource, MemtoReg, IRWrite, MemWrite, MemRead, IorD, PCWriteCond, PCWrite} = 16'b0;
        NS = S0; 

        case (S)
            S0: begin 
                MemRead = 1;
                ALUSrcA = 0;
                IorD = 0;
                IRWrite = 1;
                ALUSrcB = 2'b01;
                ALUOp = 2'b00;
                PCWrite = 1;
                PCSource = 2'b00;
                NS = S1;
            end

            S1: begin 
                ALUSrcA = 0;
                ALUSrcB = 2'b11;
                ALUOp = 2'b00;
                if (Op == LW || Op == SW)
                    NS = S2;
                else if (Op == R_TYPE)
                    NS = S6;
                else if (Op == BEQ)
                    NS = S8;
                else if (Op == JUMP)
                    NS = S9;
            end

            S2: begin 
                ALUSrcA = 1;
                ALUSrcB = 2'b10;
                ALUOp = 2'b00;
                if (Op == LW)
                    NS = S3;
                else 
                    NS = S5;
            end

            S3: begin 
                MemRead = 1;
                IorD = 1;
                NS = S4;
            end

            S4: begin 
                RegDst = 0;
                RegWrite = 1;
                MemtoReg = 1;
                NS = S0;
            end

            S5: begin 
                MemWrite = 1;
                IorD = 1;
                NS = S0;
            end

            S6: begin 
                ALUSrcA = 1;
                ALUSrcB = 2'b00;
                ALUOp = 2'b10;
                NS = S7;
            end

            S7: begin 
                RegDst = 1;
                RegWrite = 1;
                MemtoReg = 0;
                NS = S0;
            end

            S8: begin 
                ALUSrcA = 1;
                ALUSrcB = 2'b00;
                ALUOp = 2'b01;
                PCWriteCond = 1;
                PCSource = 2'b01;
                NS = S0;
            end

            S9: begin 
                PCWrite = 1;
                PCSource = 2'b10;
                NS = S0;
            end
            
            default: NS = S0; 
        endcase
    end

endmodule
