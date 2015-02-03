module register #(parameter SIZE_ = 8) (
    input clk_,
    input load_reg_,
    input [SIZE_-1:0] d_,
    output [SIZE_-1:0] q_
);

    reg [SIZE_-1:0] mem_;

    assign q_ = mem_;

    initial begin
        mem_ = 0;
    end

    always @ (posedge clk_) begin
        if (load_reg_) begin
            mem_ <= d_;
        end
    end

endmodule 