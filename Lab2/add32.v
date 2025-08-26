`include "add8.v"

module add32(sum,cout,a,b,cin);
	input [31:0] a,b;
	input cin;
	output[31:0] sum;
	output cout;
	
	wire c1,c2,c3;
	
	add8 a1(sum[7:0],c1,a[7:0],b[7:0],cin);
	add8 a2(sum[15:8],c2,a[15:8],b[15:8],c1);
	add8 a3(sum[23:16],c3,a[23:16],b[23:16],c2);
	add8 a4(sum[31:24],cout,a[31:24],b[31:24],c3);
endmodule
