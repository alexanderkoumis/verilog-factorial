module cmp_tb();

    paramter SIZE = 8;

    reg clk;
    reg [7:0] a;
    reg [7:0] b;
    wire gt;

    cmp #(.SIZE_(SIZE)) cmp(
        .a_(a),
        .b_(b),
        .gt_(gt)
    );

    initial begin
        $display("clk\ta\tb\tgt");
        $monitor("%b\t%d\t%d\t%b", clk, a, b, gt);

        clk = 0;

        for (a = 0; a < 10; a = a + 1) begin
            for (b = 0; b < 10; b = b + 1) begin
                #10
                if (gt != a > b) begin
                    $display("Error! %d < %d!", a, b);
                end
            end
        end

        $finish;
        
    end

    always begin
        #5 clk = !clk;
    end

endmodule