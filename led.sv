module led #(parameter N=2)
    (
    input logic clkIn,
    input logic rst,
    output logic ledOut
    );

int ticks;

always_ff @(posedge clkIn) begin
    
    if(rst) begin
        ticks <= 0;
        ledOut <= 0;
    end
    else if (ticks == N - 1) begin
        ticks <= 0;
        ledOut <= ~ledOut;
    end 
    else begin
        ticks <= ticks + 1; 
    end
end

endmodule