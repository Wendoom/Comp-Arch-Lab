module RegFile(
    input clk,
    input reset,
    input RegWrite,      
    input [4:0] ReadReg1,
    input [4:0] ReadReg2,      
    input [4:0] WriteReg,    
    input [31:0] WriteData,  
    output [31:0] ReadData1,    
    output [31:0] ReadData2    
);
   reg [31:0] registers [31:0];
   assign ReadData1 = registers[ReadReg1];
   assign ReadData2 = registers[ReadReg2];
   always @(posedge clk or negedge reset) begin
        if (!reset) begin
            integer i;
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
        end else if (RegWrite && (WriteReg != 5'b0)) begin
            registers[WriteReg] <= WriteData;
        end
    end

endmodule
