module TOP(
    input logic clk,sw[0],
    output logic led
    );
    
logic clk_out;
logic led_aux;

risc_v  instan1(clk_out,sw[0],led_aux);
clk_sys inst2 (clk_out,sw[0],clk);
led inst3 (led_aux,sw[0],led);

endmodule