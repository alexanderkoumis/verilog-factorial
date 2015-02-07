module factorial_tb();

    parameter SIZE = 8;

    reg clk;
    reg go;
    reg [SIZE-1:0] n;
    reg [SIZE-1:0] exp_result;

    wire [2:0] curr_state;
    wire done;    
    wire [SIZE-1:0] result;

    integer i;

    factorial_top #(.SIZE(SIZE)) factorial_top (
        .clk(clk),
        .go(go),
        .n(n),
        .curr_state(curr_state),
        .done(done),
        .result(result),
        .proceed(proceed)
    );

    initial begin
        $dumpfile("factorial_tb.lxt2");
        $dumpvars(0,factorial_tb);
        
        $display("clk\tgo\tcs\tproceed\tdone\tresult");
        $monitor("%b\t%b\t%d\t%b\t%b\t%d",
            clk, go, curr_state, proceed, done, result);
        
        clk = 0;
        go = 1;
        n = 5;

        #50
        exp_result = 5 * 4 * 3 * 2 * 1;

        // Waiting every clock cype for done signal

        for (i = 0; i < 100; i = i + 1) begin
            #5
            if (done) begin
                if (result != exp_result) begin
                    $display("Error! Factorial of %d == %d, not %d!",
                        n, exp_result, result);
                end else begin
                    $display("Result is correct! Factorial of %d == %d!",
                        n, exp_result);
                end
            end
        end

        $finish;
    end

    always begin
        #5 clk = !clk;
    end

endmodule