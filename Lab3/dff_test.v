`include "dff.v"

module Testing; 
    reg d, clk, rst; 
    wire q; 

    dff dff_inst (.d(d), .clearb(rst), .clock(clk), .q(q));  

    // Clock generation: toggles every 5 time units
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin 
        d = 0; rst = 1; 
        #4 
        d = 1; rst = 0; 
        #50 
        d = 1; rst = 1; 
        #20 
        d = 0; rst = 0; 
        #10
        $finish;
    end

    // Display output at each clock edge
    always @(posedge clk) begin 
        $display("Time=%0t: d=%b, clk=%b, rst=%b, q=%b", $time, d, clk, rst, q); 
    end 
endmodule
