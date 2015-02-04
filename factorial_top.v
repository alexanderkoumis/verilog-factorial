module factorial_top #(parameter SIZE = 8) (
        input clk,
    	input go,
        input [SIZE-1:0] n,
        output [2:0] curr_state,
        output done,
        output [SIZE-1:0] result
);

    wire proceed;
    wire cnt_load;
    wire cnt_en;
    wire reg_sel;
    wire reg_load;
    
    cu cu(
        .clk(clk),
        .go(go),
        .proceed(proceed),
        .cnt_load(cnt_load),
        .cnt_en(cnt_en),
        .reg_sel(reg_sel),
        .reg_load(reg_load),
        .curr_state(curr_state),
        .done(done)
    );

    dp #(.SIZE(SIZE)) dp (
        .clk(clk),
        .n(n),
        .cnt_load(cnt_load),
        .cnt_en(cnt_en),
        .reg_sel(reg_sel),
        .reg_load(reg_load),
        .proceed(proceed),
        .result(result)
    );

endmodule