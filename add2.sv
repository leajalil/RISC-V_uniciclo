module add2 #(parameter width=64)
    (input logic [width-1:0] pcOld,inputShift,
     output logic [width-1:0] pcNew);

assign pcNew=pcOld+inputShift;

endmodule
