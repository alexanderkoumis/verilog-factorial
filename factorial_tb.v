module factorial_tb();

    parameter SIZE = 8;

    reg clk;
    reg go;
    reg [SIZE-1:0] n;
    reg exp_result;

    wire [2:0] curr_state;
    wire done;    
    wire [SIZE-1:0] result;

    factorial_top #(.SIZE(SIZE)) factorial_top (
        .clk(clk),
        .go(go),
        .n(n),
        .curr_state(curr_state),
        .done(done),
        .result(result)
    );

    initial begin
        $dumpfile("factorial_tb.lxt2");
        $dumpvars(0,factorial_tb);
        
        $display("clk\tgo\tcs\tdone\tresult");
        $monitor("%b\t%b\t%d\t%b\t%d",
            clk, go, curr_state, done, result);
        
        clk = 0;
        go = 1;
        n = 5;

        #500
        exp_result = 5 * 4 * 3 * 2 * 1;
        if (result != exp_result) begin
            $display("Error! Factorial of %d == %d, not %d!",
                n, exp_result, result);
        end else begin
            $display("Result is correct! Factorial of %d == %d!",
                n, exp_result);
        end

        $finish;
    end

    always begin
        #5 clk = !clk;
    end

endmodule