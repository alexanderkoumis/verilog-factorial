module register #(parameter SIZE = 8) (
        input clk,
        input load_reg,
        input [SIZE-1:0] d,
        output [SIZE-1:0] q
);

    reg [SIZE-1:0] mem;

    assign q = mem;

    initial begin
        mem <= 0;
    end

    always @ (posedge clk) begin
        if (load_reg) begin
            mem <= d;
        end else begin
            mem <= mem;
        end
    end

endmodule 