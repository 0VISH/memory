module d(d,clk,q,qn);
    input d,clk;
    output qn;
    output reg q;

    always @(posedge clk) begin
        case({d})
            1'b0: q <= 0;
            1'b1: q <= 1;
        endcase
    end

    assign qn = ~q;
endmodule