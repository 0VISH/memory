module mod4(rst, clk, out);
    input rst, clk;
    output [3:0] out;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            out = 4'b0000;
        end else begin
            out = out + 1;
        end
    end
endmodule