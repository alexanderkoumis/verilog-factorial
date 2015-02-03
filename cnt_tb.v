module cnt_tb();
   
    parameter SIZE = 8;

    reg clk;
    reg en;
    reg load_cnt; 
    reg [SIZE-1:0] d;
    wire [SIZE-1:0] q;

    reg error;

    cnt #(.SIZE_(SIZE)) cnt (
        .clk_(clk),
        .en_(en),
        .load_cnt_(load_cnt),
        .d_(d),
        .q_(q)
    );

    initial begin
        clk = 0;
        en = 0;
        load_cnt = 1;
        d = 0;

        error = 0;

        #20
        if (q != 0) begin
            $display("Error! en == 0, q should be 0, not %d", en, q);
            error = 1;
        end

        #5
        en = 1;
        load_cnt = 0;

        #10
        if (q == 0) begin
            $display("Error! en == 1, load_reg == 1, q should not be 0");
            error = 1;
        end

        #5
        if (q != 1) begin
            $display("One clock cycle has passed since en == 1 and " +
                     "load_reg was set to 0. q should be 1, not %d", q);
            error = 1;
        end

        #10
        if (!error) begin
            $display("All tests passed!");
        end
        $finish;
    end

    always begin
        #5 clk = !clk;
    end

endmodule