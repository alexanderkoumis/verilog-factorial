module cu #(parameter SIZE = 8) (
        input clk,
        input go,
        input proceed,
        output [2:0] curr_state,    
        output init,
        output done
);

    reg [2:0] curr_state;
    reg [2:0] next_state;
    reg init;
    reg done;

    initial begin
        curr_state = 0;
    end

    // State assignment
    always @ (posedge clk) begin
        curr_state <= next_state;
    end

    // Next state logic
    always @ (*) begin
        case (curr_state)
            3'd0: begin
                next_state <= go ? 1 : 0;
            end
            3'd1: begin
                next_state <= proceed ? 2: 4;
            end
            3'd2: begin
                next_state <= 3;
            end
            3'd3: begin
                next_state <= 1;
            end
            3'd4: begin
                next_state <= 0;
            end
        endcase
    end

    // Output logic
    always @ (*) begin
        case (curr_state)
            3'd0: begin
                init <= go? 1 : 0;
                done <= 0;
            end
            3'd1: begin
                init <= 0;
                done <= 0;
            end
            3'd2: begin
                init <= 0;
                done <= 0;
            end
            3'd3: begin
                init <= 0;
                done <= 0;
            end
            3'd4: begin
                init <= 0;
                done <= 1;
            end
        endcase
    end

endmodule