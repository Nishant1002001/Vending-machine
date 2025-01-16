module vending_machine_tb;
    reg clk;
    reg reset;
    reg [1:0] inp;
    wire out;
    wire [1:0] change;

    // Instantiate the vending_machine module
    vending_machine uut (
        .clk(clk),
        .reset(reset),
        .inp(inp),
        .out(out),
        .change(change)
    );
    
    always begin
        #5 clk = ~clk;
    end

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        inp = 2'b00;

        // Wait for reset
        #10;
        reset = 0;

        // Test case 1: insert 0rs
        inp = 2'b00;
        #10;

        // Test case 2: Insert 5 Rs
        inp = 2'b01;
        #10;

        // Test case 3: Insert 10 Rs 
        inp = 2'b10;
        #10;

        // Test case 4: Insert 5 Rs again
        inp = 2'b01;
        #10;

        // Test case 5: Insert another 5 Rs 
        inp = 2'b01;
        #10;

        // Test case 6: Insert 10 Rs 
        inp = 2'b10;
        #10;

        // Test case 7: Insert 0 Rs
        inp = 2'b00;
        #10;
        
        $finish;
    end
endmodule
