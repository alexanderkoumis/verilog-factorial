module dp #(parameter SIZE = 8) (
    input clk,
    input [SIZE-1:0] n,
    input sel_init,
    input cnt_load,
    input cnt_en,
    input reg_load,
    input done,
    output proceed,
    output [SIZE-1:0] result
);

    wire [SIZE-1:0] cnt_q;
    wire [SIZE-1:0] mux_sig_1;
    wire [SIZE-1:0] mul_z;
    wire [SIZE-1:0] reg_q;
    wire [SIZE-1:0] mux_sig_2;

    assign result = done ? reg_q : 0;

    mux #(.SIZE(SIZE)) mux_1(
        .sel_(sel_init),
        .sig_1_(8'b1),
        .sig_0_(cnt_q),
        .mux_sig_(mux_sig_1)
    );

    cmp #(.SIZE(SIZE)) cmp(
        .a_(n),
        .b_(mux_sig_1),
        .gt_(proceed)
    );

    cnt #(.SIZE(SIZE)) cnt (
        .clk_(clk),
        .en_(cnt_en),
        .load_cnt_(cnt_load),
        .d_(8'b1),
        .q_(cnt_q)
    );

    mul #(.SIZE(SIZE)) mul(
        .x_(cnt_q),
        .y_(mux_sig_2),
        .z_(mul_z)
    );

    mux #(.SIZE(SIZE)) mux_2(
        .sel_(sel_init),
        .sig_1_(8'b1),
        .sig_0_(mul_z),
        .mux_sig_(mux_sig_2)
    );

    register #(.SIZE(SIZE)) register(
        .clk_(clk),
        .load_reg_(load_reg),
        .d_(mux_sig_2),
        .q_(result)
    );

endmodule