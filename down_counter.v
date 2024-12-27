`timescale 1ns / 1ps
// parameter controlled down counter

module down_counter
    // n sets the register size
    #(parameter n = 3) 
    (
    input            clock,
    input            reset,
    output reg [n:0] count
    );
    
    // always block for a counter
    always @ (posedge(clock), posedge(reset)) 
    begin
        if (reset)
        begin
            // reset counter to max value by setting bits to all 1's
            count <= {n{1'b1}};
        end
        else
        begin
            // decrement count by 1
            count <= count - 1;
        end
    end
        
endmodule
