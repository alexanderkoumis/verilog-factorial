module mux #(parameter SIZE = 8)(
        input sel,
        input [SIZE-1:0] sig_1,
        input [SIZE-1:0] sig_0,
        output [SIZE-1:0] mux_sig
);

    assign mux_sig = sel ? sig_1 : sig_0;

endmodule