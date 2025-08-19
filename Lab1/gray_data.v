module gray_data(a,b,c,d,w,x,y,z);
	input a,b,c,d;
	output w,x,y,z;
	
	assign x=c^d;
	assign y=b^c;
	assign z=a^b;
	assign w=a&1;

endmodule
	
	
