module cu(
		input clk,
		input go,
		input proceed,
		output cnt_load,
		output cnt_en,
		output reg_sel,
		output reg_load,
		output [2:0] curr_state,
		output done
);

    reg [2:0] curr_state;
    reg cnt_load;
    reg cnt_en;
    reg reg_load;
    reg reg_sel;

    initial begin
        cnt_en = 1;
        curr_state = 0;
    end

    always @ (posedge clk) begin
        case(curr_state)
            3'd0: begin
                cnt_load <= 1;
                reg_load <= 1;
                curr_state <= go ? 1 : 0;
            end
            3'd1: begin
                reg_sel <= 1;
                curr_state <= 2;
            end
            3'd2: begin
                reg_sel <= 0;
                curr_state <= proceed ? 3 : 5; 
            end
            3'd3: begin
                curr_state <= 4;
            end
            3'd4: begin
                cnt_load <= 0;
                curr_state <= 2;
            end
            3'd5: begin
                curr_state <= 0;
            end
        endcase
    end

endmodule