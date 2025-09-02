`include "jk_ff.v"
module sync_counter(clk, q);
input clk;
output [3:0] q;

wire q0, q1, q2, q3;
wire qb0, qb1, qb2, qb3;


jk_ff ff0(1'b1, 1'b1, clk, q0, qb0);
jk_ff ff1(q0, q0, clk, q1, qb1);
jk_ff ff2(q0 & q1, q0 & q1, clk, q2, qb2);
jk_ff ff3(q0 & q1 & q2, q0 & q1 & q2, clk, q3, qb3);

assign q = {q3, q2, q1, q0};
endmodule



