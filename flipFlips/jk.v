module jk(j, k, clk, q, qn);
    input j,k,clk;
    output qn;
    output reg q;

    always @(posedge clk) begin
        case({j,k})
            2'b00: q <= q;
            2'b01: q <= 0;
            2'b10: q <= 1;
            2'b11: q <= ~q;
        endcase
    end

    assign qn = ~q;
endmodule

module tb();
    reg j,k,clk;
    wire q, qn;
    jk jkff(j, k, clk, q, qn);

    initial begin
        $monitor("%d %d %d %d", j, k, q, qn);
        clk = 1;
        j = 0;
        k = 1;
        #100;
        clk = 0;
        #100;
        clk = 1;
        j = 1;
        k = 0;
        #100;
        clk = 0;
        #100;
        clk = 1;
        j = 0;
        k = 0;
    end
endmodule