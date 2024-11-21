module piso(pi, clk, load, rst, so);
    input clk, rst, load;
    input [3:0] pi;
    output reg so;

    reg [3:0] mem;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            mem <= 4'b0000;
        end else if(load) begin
            mem <= pi;
        end else begin
            so = mem[3];
            mem = mem << 1;
        end
    end
endmodule