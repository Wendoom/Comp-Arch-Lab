`include "mux.v"
module testmux; 
     
    reg [0:3] in; 
    reg [0:1] sel; 
    wire out; 
     
    mux mux(out,in,sel); 
  
initial 
begin 
$monitor("in=%b | sel=%b | out=%b",in,sel,out); 
end 
  
initial  
begin 
  
      in=4'b1010; sel=2'b00; 
   #3 in=4'b1010; sel=2'b01;  
   #3 in=4'b1010; sel=2'b10; 
   #3 in=4'b1010; sel=2'b11; 
    
end 
endmodule 
