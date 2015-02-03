module mul #(parameter SIZE_ = 8) (
	input  [7:0] x_,
	input  [7:0] y_,
	output [7:0] z_
);

	assign z_ = x_ * y_;

endmodule