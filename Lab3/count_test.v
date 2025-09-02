`include "count.v"
module counter_test;
reg clk;
wire [3:0] q;

sync_counter uut(clk, q);

initial begin
clk = 0;
$monitor($time, " Count = %b", q);
#100 $finish;
end

always #5 clk = ~clk; // Clock with period 10
endmodule
