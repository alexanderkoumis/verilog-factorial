module cnt #(parameter SIZE = 8) (
        input clk,
        input en,
        input load_cnt,
        input [SIZE-1:0] d,
        output [SIZE-1:0] q
);

    reg [SIZE-1:0] mem;

    assign q = mem;

    always @ (posedge clk) begin
        if (en) begin
            if (load_cnt) begin
                mem <= d;
            end else begin
                mem <= mem - 1;
            end
        end
    end

endmodule