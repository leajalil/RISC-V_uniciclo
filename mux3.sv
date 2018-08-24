module mux3 #(parameter width=64)
    (input logic [width-1:0] add1,add2,
     input logic ofAND,
     output logic [width-1:0] toPC);

    
assign toPC=ofAND ? add2 : add1;

endmodule
