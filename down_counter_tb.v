`timescale 1ns / 1ps
// testbench for down_counter

module down_counter_tb;
    // parameters for user to set
    parameter N = 3;    
    // inputs are registers
    reg  clock, reset;
    // outputs are wires since they're continuously driven
    wire [N:0] count;

    // instantiating the down_counter
    down_counter #(.n(N)) uut 
    (
    .clock(clock),
    .reset(reset),
    .count(count)
    );
    
    // Start of testbench instructions for testing the down_counter

    // initializing values for the simulation
    initial 
    begin
        clock = 0;
        reset = 0;
    end
    
    // creating the oscillating clock
    always #10 clock = ~clock;

    // set reset high to start counter at max value then set reset low
    initial 
    begin
        reset = 1'b1;
        #10;
        reset = 1'b0;
    end
    
endmodule