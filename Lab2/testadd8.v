`include "add8.v"
module testbench;
	reg [7:0] a, b;
	reg cin;
	wire [7:0] sum;
	wire cout;

	add8 uut(sum, cout, a, b, cin);

	initial begin
		$monitor($time, " a=%b, b=%b, cin=%b -> sum=%b, cout=%b", a, b, cin, sum, cout);

		a = 8'b00000000; b = 8'b00000000; cin = 0;
		#5;

		a = 8'b00000001; b = 8'b00000001; cin = 0;
		#5;

		a = 8'b00001111; b = 8'b00001111; cin = 0;
		#5;

		a = 8'b11111111; b = 8'b00000001; cin = 0;
		#5;

		
		a = 8'b10000000; b = 8'b10000000; cin = 0;
		#5;
 
		a = 8'd200; b = 8'd100; cin = 1;
		#5;

		a = 8'd45; b = 8'd78; cin = 1;
		#5;

		$finish;
	end
endmodule
