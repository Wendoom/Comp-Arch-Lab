`include "compare_beh.v"

module tb_comp;
	reg a0,a1,a2,a3,b0,b1,b2,b3;
	wire gre,equ,less;
	
	compare_beh comp(a0,a1,a2,a3,b0,b1,b2,b3,gre,equ,less);
	
	initial begin
        $monitor($time, " gre=%b equ=%b less=%b", gre,equ,less);
         
        #0  a0=1; a1=1; a2=0; a3=0;b0=0;b1=0;b2=1;b3=1;
        #10 $finish;
    end
endmodule

