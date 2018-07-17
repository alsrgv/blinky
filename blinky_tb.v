`timescale 1ns / 1ps

`define assert(signal, value) \
    if (signal !== value) begin \
        $display("ASSERTION FAILED: %0d != %0d", signal, value); \
	$finish; \
    end

module blinky_tb;

reg clk;
wire led;

blinky #(1000) b (
    .clk (clk),
    .led (led)
);

initial
    clk = 0;

always
    #4 clk = !clk;

initial
begin
    #0 `assert(led, 0);
    #500000 `assert(led, 1);
    #500000 `assert(led, 0);
    #500000 `assert(led, 1);
    #500000 `assert(led, 0);
    $finish;
end

endmodule
