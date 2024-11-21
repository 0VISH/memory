module siso(si, clk, rst, so);
    input si, clk, rst;
    output reg so;

    reg [3:0] mem;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            mem <= 4'b0000;
        end else begin
            so = mem[3];
            mem = mem << 1;
            mem[0] = si;
        end
    end
endmodule

module tb();
    reg si, clk, rst;
    wire so;
    siso sso(si, clk, rst, so);

    initial begin
        $monitor("%d %b %d", so, sso.mem, si);
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