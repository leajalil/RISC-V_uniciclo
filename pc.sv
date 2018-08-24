module pc #(parameter width=64)
    (input logic clk,
     input logic rst,
     input logic [width-1:0] nextPc,
     output logic [width-1:0] regPc);

     
always_ff @(posedge clk) 
    if(rst)
        regPc<=0;
    else
        regPc<=nextPc;
        
endmodule