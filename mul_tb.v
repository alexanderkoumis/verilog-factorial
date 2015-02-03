module mul_tb();

    parameter SIZE = 8;

    reg clk;
    reg [7:0] x;
    reg [7:0] y;
    wire [7:0] z;

    mul #(.SIZE_(SIZE)) mul(
        .x_(x),
        .y_(y),
        .z_(z)
    );

    initial begin
        $display("clk\tx\ty\tz");
        $monitor("%b\t%d\t%d\t%d", clk, x, y, z);
        clk = 0;
        for (x = 0; x < 10; x = x + 1) begin
            for (y = 0; y < 10; y = y + 1) begin
                #10
                if (z != x * y) begin
                    $display("Error! %d * %d != %d", x, y, z);
                end
            end
        end
        $finish;
    end

    always begin
        #5 clk = !clk;
    end

endmodule