module johnson(rst, clk, out);
    input rst, clk;
    output reg [3:0] out;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            out <= 4'b0001;
        end else begin
            out <= {out[2:0], ~out[3]};
        end
    end
endmodule

module tb();
    reg rst, clk;
    wire [3:0] out;

    johnson john(rst, clk, out);
    integer i;
    initial begin
        clk = 1;
        rst = 1;
        #100;
        rst = 0;
        $monitor("%b %b", clk, out);
        for(i=0; i<20; i=i+1)begin
            clk = ~clk;
            #100;
        end
    end
endmodule