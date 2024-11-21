module updown(clk, rst, up, down, out);
    input clk, rst, up, down;
    output reg [3:0] out;

    always @(posedge clk or posedge rst) begin
        if(rst) out <= 4'b0000;
        else begin
            if(up) out <= out + 1;
            else if(down) out <= out - 1;
        end
    end
endmodule