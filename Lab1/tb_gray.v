`include "gray.v"

module tb_gray;
    reg a, b, c, d;
    wire w, x, y, z;

    gray gray_data(a, b, c, d, w, x, y, z);

    initial begin
        $monitor($time, " a=%b b=%b c=%b d=%b -> w=%b x=%b y=%b z=%b", a, b, c, d, w, x, y, z);
         
        #0  a=0; b=0; c=0; d=0;  
        #5  a=0; b=0; c=0; d=1; 
		#5  a=1; b=0; c=0; d=1;
        #10 $finish;
    end
endmodule
