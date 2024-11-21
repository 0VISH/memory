module pipo(pi, clk, rst, po);
    input clk, rst;
    input [3:0] pi;
    output reg [3:0] po;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            po <= 4'b0000;
        end else begin
            po <= pi;
        end
    end
endmodule