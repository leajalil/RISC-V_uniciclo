module mux2 #(parameter width=64)
    (input logic memToReg,
     input logic [width-1:0] readData,ALUresul,
     output logic [width-1:0] toWriteData);

assign toWriteData= memToReg ? readData : ALUresul;

endmodule
