module factorial_top #(parameter SIZE = 8) (
        input clk,
        input go,
        input [SIZE-1:0] n,
        output [2:0] curr_state,
        output done,
        output [SIZE-1:0] result
);

    wire init;

    cu #(.SIZE(SIZE)) cu (
        .clk(clk),
        .go(go),
        .proceed(proceed),
        .curr_state(curr_state),
        .init(init),
        .done(done)
    );

    dp #(.SIZE(SIZE)) dp (
        .clk(clk),
        .n(n),
        .init(init),
        .done(done),
        .proceed(proceed),
        .result(result)
    );


endmodule