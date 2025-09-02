module jk_ff(j, k, clk, q, qbar);
input j, k, clk;
output reg q;
output qbar;
assign qbar = ~q;
initial q=0;
always @(posedge clk) begin
case ({j, k})
2'b00: q <= q; 
2'b01: q <= 0; 
2'b10: q <= 1; 
2'b11: q <= ~q; 
endcase
end
endmodule
