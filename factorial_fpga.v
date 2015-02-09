module factorial_fpga(
		input CLK_100MHz,
		input [7:0] SW,
		output [7:0] LED,
		output CSN,
		output MOSI,
		output SCK
);

	wire [7:0] sw_buf;


	wire done;

	wire [7:0] byteresult;
	wire [31:0] wordresult;


	IBUF sw7 ( .I(SW[7]), .O(sw_buf[7]) );
	IBUF sw6 ( .I(SW[6]), .O(sw_buf[6]) );
	IBUF sw5 ( .I(SW[5]), .O(sw_buf[5]) );
	IBUF sw4 ( .I(SW[4]), .O(sw_buf[4]) );
	IBUF sw3 ( .I(SW[3]), .O(sw_buf[3]) );
	IBUF sw2 ( .I(SW[2]), .O(sw_buf[2]) );
	IBUF sw1 ( .I(SW[1]), .O(sw_buf[1]) );
	IBUF sw0 ( .I(SW[0]), .O(sw_buf[0]) );

	OBUF led7 ( .I(sw_buf[7]), .O( LED[7]) );
	OBUF led6 ( .I(sw_buf[6]), .O( LED[6]) );
	OBUF led5 ( .I(sw_buf[5]), .O( LED[5]) );
	OBUF led4 ( .I(sw_buf[4]), .O( LED[4]) );
	OBUF led3 ( .I(sw_buf[3]), .O( LED[3]) );
	OBUF led2 ( .I(sw_buf[2]), .O( LED[2]) );
	OBUF led1 ( .I(sw_buf[1]), .O( LED[1]) );
	OBUF led0 ( .I(sw_buf[0]), .O( LED[0]) );


	factorial_top #(.SIZE(8)) factorial_top (
		.clk(CLK_100MHz),
		.go(1'b1),
		.n(sw_buf),
		.curr_state(),
		.done(done),
		.result(byteresult)
	);
	
	pmod_spi pmod_spi(
		.clk(CLK_100MHz),
		.ld_number(1'b1),
		.number(wordresult),
		.csn(CSN),
		.mosi(MOSI),
		.sck(SCK)
	);

    bcd bcd(
        .binary(byteresult),
        .bcd_out(wordresult)
    );


endmodule
