module vending_machine(clk, reset, inp, out, change);
    input clk;
    input reset;
    input [1:0] inp;          
    output reg out;
    output reg [1:0] change;

    parameter s0 = 2'b00; // 00=0rs, 01=5rs, 10=10rs
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;

    reg [1:0] c_state;
    reg [1:0] n_state;

    always @(posedge clk)
    begin
        if (reset == 1)
        begin
            c_state = 2'b00;
            n_state = 2'b00;
            change = 2'b00;
        end
        else
            c_state = n_state;

        case (c_state)
            s0: // machine has 0 rs
                if (inp == 2'b00)
                begin
                    n_state = s0;
                    out = 0;
                    change = 2'b00;
                end
                else if (inp == 2'b01)
                begin
                    n_state = s1;
                    out = 0;
                    change = 2'b00;
                end
                else if (inp == 2'b10)
                begin
                    n_state = s2;
                    out = 0;
                    change = 2'b00;
                end
            s1: // machine has 5 rs
                if (inp == 2'b00)
                begin
                    n_state = s0;
                    out = 0;
                    change = 2'b01; // change returned 5 rs
                end
                else if (inp == 2'b01)
                begin
                    n_state = s2;
                    out = 0;
                    change = 2'b00;
                end
                else if (inp == 2'b10)
                begin
                    n_state = s0;
                    out = 1; // return 1 bottle
                    change = 2'b00;
                end
            s2: // machine has 10 rs
                if (inp == 2'b00)
                begin
                    n_state = s0;
                    out = 0;
                    change = 2'b10;
                end
                else if (inp == 2'b01)
                begin
                    n_state = s0;
                    out = 1;
                    change = 2'b00;
                end
                else if (inp == 2'b10)
                begin
                    n_state = s0;
                    out = 1;
                    change = 2'b01;
                end
        endcase
    end 
endmodule
