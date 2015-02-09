module cu #(parameter SIZE = 8) (
        input clk,
        input go,
        input proceed,
        output reg [2:0] curr_state,    
        output reg init,
        output reg done
);

    reg [2:0] next_state;

    initial begin
        curr_state = 3'b0;
    end

    // State assignment
    always @ (posedge clk) begin
        curr_state <= next_state;
    end

    // Next state logic
    always @ (*) begin
        case (curr_state)
            3'd0: begin
                next_state <= go ? 3'd1 : 3'd0;
            end
            3'd1: begin
                next_state <= proceed ? 3'd2: 3'd4;
            end
            3'd2: begin
                next_state <= 3'd3;
            end
            3'd3: begin
                next_state <= 3'd1;
            end
            3'd4: begin
                next_state <= 3'd0;
            end
            default: begin
                next_state <= 3'd0;
            end
        endcase
    end

    // Output logic
    always @ (*) begin
        case (curr_state)
            3'd0: begin
                init <= go? 1'b1 : 1'b0;
                done <= 1'b0;
            end
            3'd1: begin
                init <= 1'b0;
                done <= 1'b0;
            end
            3'd2: begin
                init <= 1'b0;
                done <= 1'b0;
            end
            3'd3: begin
                init <= 1'b0;
                done <= 1'b0;
            end
            3'd4: begin
                init <= 1'b0;
                done <= 1'b1;
            end
            default: begin
                init <= 1'b0;
                done <= 1'b0;
            end
        endcase
    end

endmodule