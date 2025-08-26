`include "fadder.v"
module add8(sum,cout,a,b,cin);
	input[7:0] a,b;
	input cin;
	output[7:0] sum;
	output cout;
	
	wire c1,c2,c3,c4,c5,c6,c7;
	
	fadder a1(sum[0],c1,a[0],b[0],cin);
	fadder a2(sum[1],c2,a[1],b[1],c1);
	fadder a3(sum[2],c3,a[2],b[2],c2);
	fadder a4(sum[3],c4,a[3],b[3],c3);
	fadder a5(sum[4],c5,a[4],b[4],c4);
	fadder a6(sum[5],c6,a[5],b[5],c5);
	fadder a7(sum[6],c7,a[6],b[6],c6);
	fadder a8(sum[7],cout,a[7],b[7],c7);
	
endmodule
