module mux1 #(parameter width=64)
    (input logic [width-1:0] readData2,immGen,
     input logic ALUSrc,
     output logic [width-1:0] out);

assign out=ALUSrc ? immGen : readData2;

endmodule
