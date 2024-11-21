module t(t,clk,rst,q,qn);
    input t,clk,rst;
    output qn;
    output reg q;

    always @(posedge clk or rst) begin
        if(rst) begin
            q <= 0;
        end else begin
            case({t})
                1'b0: q <= q;
                1'b1: q <= ~q;
            endcase
        end
    end

    assign qn = ~q;
endmodule

module tb();
    reg t,clk,rst;
    wire q, qn;
    t tff(t, clk, rst, q, qn);

    initial begin
        $monitor("%d %d %d", t, q, qn);
        clk = 1;
        rst = 1;
        #100;
        clk = 0;
        rst = 0;
        #100;
        clk = 1;
        t = 1;
        #100;
        clk = 0;
        #100;
        clk = 1;
        t = 0;
    end
endmodule