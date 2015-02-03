module mux(
	input sel_,
	input sig_1_,
	input sig_0_,
	output mux_sig_
);

	assign mux_sig_ = sel_ ? sig_1_ : sig_0_;

endmodule