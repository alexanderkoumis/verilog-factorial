module mux_tb();

    reg clk;
    reg sel;
    reg sig_1;
    reg sig_0;
    wire mux_sig;

    integer i, j, k;
    reg error;

    mux mux(
        .sel(sel),
        .sig_1(sig_1),
        .sig_0(sig_0),
        .mux_sig(mux_sig)
    );

    initial begin
        $display("sel\tsig_1\tsig_0\tmux_sig");
        $monitor("%b\t%b\t%b\t%b", sel, sig_1, sig_0, mux_sig);
        
        clk = 0;
        sel = 0;
        sig_1 = 0;
        sig_0 = 0;
        error = 0;

        for (i = 0; i < 2; i = i + 1) begin
            for (j = 0; j < 2; j = j + 1) begin
                for (k = 0; k < 2; k = k + 1) begin
                    #10
                    if ((i && (mux_sig != sig_1)) ||
                       (!i && (mux_sig != sig_0))) begin
                       $display("Error! With select == %b, sig_1 == %b, " +
                                "and sig_0 == %b, mux_sig should be %b",
                                sel, sig_1, sig_0, !mux_sig);
                       error = 1;
                    end
                    sig_0 = sig_0 + 1;
                end
                sig_1 = sig_1 + 1;
            end
            sel = sel + 1;
        end

        if (!error) begin
            $display("All tests passed!");
        end
        
        $finish;
    end

    always begin
        #5 clk = !clk;
    end

endmodule