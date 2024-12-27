// testbench for down_counter

module down_counter_tb;
    // inputs are registers
    // outputs are wires since they're continuously driven
    reg  clock, reset;
    wire count;

    // parameters for user to set
    parameter N = 3;

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

    // trigger reset to start counter at max value then make reset low
    initial 
    begin
        reset = 1'b1;
        #10;
        reset = 1'b0;
    end
    
endmodule