module mux4_1(regData, q1, q2, q3, q4, reg_no);
    input [31:0] q1, q2, q3, q4;
    input [1:0] reg_no;           // Select line: 2 bits to select 1 of 4
    output [31:0] regData;

    assign regData = (reg_no == 2'b00) ? q1 :
                     (reg_no == 2'b01) ? q2 :
                     (reg_no == 2'b10) ? q3 :
                     q4; // default for 2'b11
endmodule
