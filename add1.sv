module add1 #(parameter width=64)
    (input logic [width-1:0] pcOld,
     output logic [width-1:0] pcNew);

assign pcNew=pcOld+4;

endmodule
