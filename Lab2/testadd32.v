`include "add32.v"

module testbench;
	reg [31:0] a, b;
	reg cin;
	wire [31:0] sum;
	wire cout;

	add32 uut(sum, cout, a, b, cin);

	initial begin
		$monitor($time, " a=%h, b=%h, cin=%b -> sum=%h, cout=%b", a, b, cin, sum, cout);

		
		a = 32'h00000000; b = 32'h00000000; cin = 0;
		#5;

		
		a = 32'h00000001; b = 32'h00000001; cin = 0;
		#5;

		
		a = 32'hFFFFFFFF; b = 32'h00000001; cin = 0;
		#5;

		a = 32'hA5A5A5A5; b = 32'h5A5A5A5A; cin = 0;
		#5;

		a = 32'h00000000; b = 32'h00000000; cin = 1;
		#5;

		a = 32'h80000000; b = 32'h80000000; cin = 0;
		#5;

		$finish;
	end
endmodule
