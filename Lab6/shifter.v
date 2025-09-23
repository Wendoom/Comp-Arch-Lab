module shiftLeft(input [25:0] in, output reg [27:0] out);

    integer i;
    always @(*) begin
        for(i=0; i<26; i=i+1) begin
            out[i+2] = in[i];
        end
        
        out[1] = 0;
        out[0] = 0;
    end

endmodule
