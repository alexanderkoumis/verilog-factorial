module dp #(parameter SIZE = 8) (
        input clk,
        input [SIZE-1:0] n,
        input cnt_load,
        input cnt_en,
        input reg_sel,
        input reg_load,
        output proceed,
        output [SIZE-1:0] result
);
    wire [SIZE-1:0] cnt_q;
    wire [SIZE-1:0] reg_q;
    wire [SIZE-1:0] mul_z;
    wire [SIZE-1:0] mux_sig;

    assign result = proceed ? 0 : reg_q;

    cmp #(.SIZE(SIZE)) cmp(
        .a(n),
        .b(cnt_q),
        .gt(proceed)
    );

    cnt #(.SIZE(SIZE)) cnt (
        .clk(clk),
        .en(cnt_en),
        .load_cnt(cnt_load),
        .d(8'b1),
        .q(cnt_q)
    );

    mul #(.SIZE(SIZE)) mul(
        .x(cnt_q),
        .y(reg_q),
        .z(mul_z)
    );

    mux #(.SIZE(SIZE)) mux1(
        .sel(reg_sel),
        .sig_1(8'b1),
        .sig_0(mul_z),
        .mux_sig(mux_sig)
    );

    register #(.SIZE(SIZE)) register(
        .clk(clk),
        .load_reg(reg_load),
        .d(mux_sig),
        .q(reg_q)
    );

    always @(clk) begin
        $monitor("cnt_q: %d", cnt_q);
    end

endmodule