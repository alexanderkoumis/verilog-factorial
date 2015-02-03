module register_tb();

    parameter SIZE = 8;
    
    reg clk;
    reg load_reg; 
    reg [SIZE-1:0] d;
    wire [SIZE-1:0] q;

    reg error;

    register #(.SIZE_(SIZE)) register(
        .clk_(clk),
        .load_reg_(load_reg),
        .d_(d),
        .q_(q)
    );

    initial begin
        clk = 0;
        load_reg = 0;
        d = 1;

        error = 0;

        #10
        if (q != 0) begin
            $display("Error! Register loaded when load_reg == 0!");
            error = 1;
        end

        #10
        load_reg = 1;

        #10
        if (q != d) begin
            $display("Error! Register output doesn't match input when loaded!");
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