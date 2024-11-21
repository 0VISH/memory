module ring4(rst, clk, out);
    input rst, clk;
    output reg [3:0] out;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            out <= 4'b0001;
        end else begin
            out <= {out[2:0], out[3]};
        end
    end
endmodule