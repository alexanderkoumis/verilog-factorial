module mul #(parameter SIZE = 8) (
        input  [SIZE-1:0] x,
        input  [SIZE-1:0] y,
        output [SIZE-1:0] z
);

    assign z = x * y;

endmodule