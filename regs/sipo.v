module sipo(si, clk, rst, po);
    input si, clk, rst;
    output reg [3:0] po;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            po <= 4'b0000;
        end else begin
            po = po << 1;
            po[0] = si;
        end
    end
endmodule

module tb();
    reg si, clk, rst;
    wire [3:0] po;
    sipo sso(si, clk, rst, po);

    initial begin
        $monitor("%b %d", po, si);
        clk = 1;
        rst = 1;
        #100;
        clk = 0;
        rst = 0;
        #100;
        clk = 1;
        si = 1;
        #100;
        clk = 0;
        #100;
        clk = 1;
        si = 1;
        #100;
        clk = 0;
        #100;
        clk = 1;
        si = 0;
        #100;
        clk = 0;
        #100;
        clk = 1;
        si = 1;
        #100;
        clk = 0;
        #100;
        clk = 1;
        si = 0;
        #100;
    end
endmodule