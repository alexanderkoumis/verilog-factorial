module cmp #(parameter SIZE = 8) (
	input  [SIZE-1:0] a_,
	input  [SIZE-1:0] b_,
	output gt_
);

	assign gt_ = a_ > b_;

endmodule