module risc_v
    (input logic clk_div,rst,
     output logic ledBlink);
    
logic [63:0] pcActual,pcNext,pcSum,pcBranch,immGe,immShift,toDataWrite,ofReadData1,ofReadData2,ofmux1,resultAlu,ReadData;
logic [31:0] instruction; 
logic [3:0] controlAlu;
logic [1:0] aluOp;
logic branch,memRead,memToReg,memWrite,aluSrc,regWrite,zero,outAnd;


add1 conex_1 (pcActual,pcSum);
add2 conex_2 (pcActual,immShift,pcBranch);
mux3 conex_3 (pcSum,pcBranch,outAnd,pcNext);
pc conex_4 (clk_div,rst,pcNext,pcActual);
instructionMemory conex_5 (pcActual,instruction);  
immGen conex_6 (instruction,immGe);
shiftImm conex_7 (immGe,immShift);
register conex_8 (clk_div,regWrite,instruction[19:15],instruction[24:20],instruction[11:7],toDataWrite,ofReadData1,ofReadData2);
control conex_9 (instruction[6:0],aluOp,branch,memWrite,memRead,regWrite,memToReg,aluSrc,ledBlink);
ALUcontrol conex_10 (aluOp,{instruction[30],instruction[14:12]},controlAlu);
mux1 conex_11 (ofReadData2,immGe,aluSrc,ofmux1);
alu conex_12 (controlAlu,ofReadData1,ofmux1,zero,resultAlu);
memory conex_13 (clk_div,resultAlu,ofReadData2,memWrite,memRead,ReadData);
mux2 conex_14 (memToReg,ReadData,resultAlu,toDataWrite);
and1 conex_15 (branch,zero,outAnd);



endmodule

