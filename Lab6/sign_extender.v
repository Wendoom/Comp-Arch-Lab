module SignExt16to32 (
    input  [15:0] in,      
    output reg [31:0] out
	);

    integer i;

    always @(*) begin
        
        out[15:0] = in;

        
        for (i = 16; i < 32; i = i + 1) begin
            out[i] = in[15];  
        end
    end

endmodule
