module dp #(parameter SIZE = 8) (
        input clk,
        input [SIZE-1:0] n,
        input init,
        input done,
        output reg proceed,
        output [SIZE-1:0] result
);

    wire [SIZE-1:0] mul_x;
    wire [SIZE-1:0] mul_y;
    wire [SIZE-1:0] mul_z;
    wire [SIZE-1:0] cmp_a;
    wire [SIZE-1:0] prod_d;
    wire gt;

    reg [SIZE-1:0] last_result;
    reg down_wait;

    // assign result = done ? last_result : 8'b0;
    assign result = last_result;
    
    mux #(.SIZE(SIZE)) reg_mux (
        .sel(init),
        .sig_1(8'b1),
        .sig_0(mul_z),
        .mux_sig(prod_d)
    );

    mux #(.SIZE(SIZE)) cmp_mux (
        .sel(init),
        .sig_1(n),
        .sig_0(mul_y),
        .mux_sig(cmp_a)
    );

    register #(.SIZE(SIZE)) product (
        .clk(clk),
        .load_reg(1'b1),
        .d(prod_d),
        .q(mul_x)
    );

    cmp #(.SIZE(SIZE)) cmp (
        .a(cmp_a),
        .b(8'b1),
        .gt(gt)
    );

    cnt #(.SIZE(SIZE)) cnt (
        .clk(clk),
        .en(1'b1),
        .load_cnt(init),
        .d(n),
        .q(mul_y)
    );

    mul #(.SIZE(SIZE)) mul (
        .x(mul_x),
        .y(mul_y),
        .z(mul_z)
    );

	
    initial begin
        down_wait = 0;
    end

    always @ (posedge clk) begin
        proceed <= gt;
        if (!proceed && !down_wait) begin
            last_result <= mul_x;
            down_wait <= 1;
        end else if (done) begin
            down_wait <= 0;
        end
    end

endmodule