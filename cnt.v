module cnt #(parameter SIZE_ = 8) (
    input clk_,
    input en_,
    input load_cnt_,
    input [SIZE_-1:0] d_,
    output [SIZE_-1:0] q_
);

    reg [SIZE_-1:0] mem_;

    assign q_ = mem_;

    always @ (posedge clk_) begin
        if (en_) begin
            if (load_cnt_) begin
                mem_ <= d_;
            end else begin
                mem_ <= mem_ + 1;
            end
        end
    end    

endmodule