/*
    Detect 101
        s0: rst
        s1: first correct bit received
        s2: second correct bit received
        s3: all correct bit received
*/

module mealy(clk, rst, x, out);
    input clk, rst, x;
    output reg out;

    parameter s0 = 2'b00;
    parameter s1 = 2'b01;
    parameter s2 = 2'b10;
    parameter s3 = 2'b11;

    reg [1:0] curState;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            curState <= s0;
        end else begin
            out <= 0;
            case({curState})
                s0: begin
                    if(x) curState <= s1;
                    else curState <= s0;
                end
                s1: begin
                    if(x) begin
                        curState <= s3;
                        out <= 1;
                    end
                    else curState <= s0;
                end
                s3: begin
                    if(x) curState <= s1;
                    else curState <= s2;
                end
            endcase
        end
    end
endmodule;

module tb;

    // Testbench inputs and outputs
    reg clk, rst, x;
    wire out;

    // Instantiate the module
    mealy uut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .out(out)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        x = 0;

        // Reset the circuit
        #10 rst = 0;

        // Apply test cases
        #10 x = 1;  // Move to s1
        #10 x = 0;  // Move to s2
        #10 x = 1;  // Should reset to s0
        #10 x = 1;  // Back to s1
        #10 x = 0;  // Move to s2
        #10 x = 0;  // Move to s3, output should be 1
        #10 x = 1;  // Stay in s3
        #10 x = 0;  // Reset to s0
        #10 x = 1;  // Move to s1 again

        // End simulation
        #20 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("clk: %b | rst: %b | x: %b | curState: %b | out: %b",
                 clk, rst, x, uut.curState, out);
    end

endmodule