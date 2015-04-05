module cmp #(parameter SIZE = 8) (
        input  [SIZE-1:0] a,
        input  [SIZE-1:0] b,
        output gt
);

    assign gt = a > b;

endmodule