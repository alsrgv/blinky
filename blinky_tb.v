`timescale 1ns / 1ps

`define assert(signal, value) \
    if (signal !== value) begin \
        $fatal(1, "ASSERTION FAILED: signal (%0d) != value (%0d)", signal, value); \
    end

module blinky_tb;

reg clk;
wire led;

// blinking at 1000 hz
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
    repeat (10) begin
      // on for 100 us, off for 900 us
      repeat (100) #1000 `assert(led, 1);
      repeat (900) #1000 `assert(led, 0);
    end
    $finish;
end

endmodule
