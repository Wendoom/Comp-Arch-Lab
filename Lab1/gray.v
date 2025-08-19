module gray(a,b,c,d,w,x,y,z);
	input a,b,c,d;
	output w,x,y,z;
	
	xor x1(x,c,d);
	xor x2(y,b,c);
	xor x3(z,a,b);
	and x4(w,a,1);

endmodule
	
	
